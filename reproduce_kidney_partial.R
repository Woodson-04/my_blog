#!/usr/bin/env Rscript

# ===============================================================
# PACS 论文复现（部分）：真实肾脏 scATAC 数据的 type-I error / power 测试
#
# 说明：
# 1) 本脚本把 notebook 中分散的 source(...) 方式改为统一加载 PACS 包。
# 2) 参数尽可能与 notebook/paper 保持一致；若无法从论文直接确认，会在注释里标出。
# 3) 数据文件默认已放在当前目录（与 notebook 一致）。
# ===============================================================

suppressPackageStartupMessages({
  library(Matrix)
  library(PACS)   # 核心：替代 notebook 中对 PACS 源码文件的逐个 source()
})

# ---------------------------
# 0. 参数区（请按需修改）
# ---------------------------
params <- list(
  data_dir = "/home/woodson/biostatistic/pacs/PACS_data",  # 用户给定数据目录
  seed = 3384,                # notebook 给定随机种子
  n_repeat = 5,               # 重复次数（notebook 为 5）
  n_cell_sample = 500,        # 每组采样细胞数（notebook 为 500）
  n_features_sample = 10000,  # 每次测试特征数（notebook 为 10000）
  count_outlier_cap = 10,     # >=10 的计数置零（notebook 规则）
  feature_total_count_cut = 18, # 仅保留行和 >18 的 peak（notebook 规则）
  t_prop_cutoff = 0.2,        # PACS 中 T_proportion_cutoff（notebook 给定）
  snap_bcv = 0.4              # snapATAC 方法 bcv（notebook 给定）
)

set.seed(params$seed)

# ---------------------------
# 1. 输入数据（与 notebook 文件名一致）
# ---------------------------
# 需要文件：
# - kidney_features_to_keep.rds
# - data_for_test_for_t1e_power.rdata （应包含 pmats 与 x.sp_cluster2）
# - r_by_ct_est_kidney_adult.rds （应包含 q_vec_new）
data_dir <- params$data_dir
if (!dir.exists(data_dir)) {
  warning(sprintf("数据目录不存在：%s；将回退到当前工作目录 %s", data_dir, getwd()))
  data_dir <- getwd()
}

kidney_features_to_keep <- readRDS(file.path(data_dir, "kidney_features_to_keep.rds"))
load(file.path(data_dir, "data_for_test_for_t1e_power.rdata"))
r_by_ct_est <- readRDS(file.path(data_dir, "r_by_ct_est_kidney_adult.rds"))

stopifnot(exists("pmats"), exists("x.sp_cluster2"))
stopifnot("q_vec_new" %in% names(r_by_ct_est))

# ---------------------------
# 2. 构建两种场景数据
#    - permuted/null-like: 仅 PT 内部随机拆组
#    - actual: PT vs LOH
# ---------------------------
pmatpt <- pmats[x.sp_cluster2 == "PT", kidney_features_to_keep]
q_val <- r_by_ct_est$q_vec_new[x.sp_cluster2 == "PT"]

actual_pmat <- pmats[x.sp_cluster2 %in% c("PT", "LOH"), kidney_features_to_keep]
actual_q_val <- r_by_ct_est$q_vec_new[x.sp_cluster2 %in% c("PT", "LOH")]
actual_cell_type_labels <- x.sp_cluster2[x.sp_cluster2 %in% c("PT", "LOH")]

# 转为 peak x cell（与 notebook 一致）
p_by_c <- t(pmatpt)
actual_p_by_c <- t(actual_pmat)

# 去除极端高计数（notebook: >=10 直接置零）
p_by_c@x[p_by_c@x >= params$count_outlier_cap] <- 0
actual_p_by_c@x[actual_p_by_c@x >= params$count_outlier_cap] <- 0
p_by_c <- drop0(p_by_c)
actual_p_by_c <- drop0(actual_p_by_c)

# 过滤低总计数 peak（notebook: rowSums > 18）
p_by_c <- p_by_c[rowSums(p_by_c) > params$feature_total_count_cut, ]
actual_p_by_c <- actual_p_by_c[rowSums(actual_p_by_c) > params$feature_total_count_cut, ]

# actual 场景拆成 PT / LOH
p_by_c1 <- actual_p_by_c[, actual_cell_type_labels == "PT"]
q_val1 <- actual_q_val[actual_cell_type_labels == "PT"]
p_by_c2 <- actual_p_by_c[, actual_cell_type_labels == "LOH"]
q_val2 <- actual_q_val[actual_cell_type_labels == "LOH"]

# ---------------------------
# 3. 函数解析：从 PACS 命名空间读取 notebook 中用到的函数
#    若版本未导出这些函数，给出明确报错。
# ---------------------------
need_funs <- c(
  "pacs_test_sparse",
  "seurat_method2_subsample",
  "snapATAC_method",
  "fisher_method",
  "archR_method"
)

fn <- lapply(need_funs, function(f) {
  if (!exists(f, where = asNamespace("PACS"), inherits = FALSE)) {
    stop(sprintf("PACS 包中未找到函数 `%s`。请检查 PACS GitHub 版本是否与 notebook 对齐。", f))
  }
  get(f, envir = asNamespace("PACS"))
})
names(fn) <- need_funs

# ---------------------------
# 4. 采样索引准备（与 notebook 逻辑一致）
# ---------------------------
n_repeat <- params$n_repeat
n_cell_sample <- params$n_cell_sample
n_features_sample <- params$n_features_sample

methods_all <- c("our", "seurat", "archR", "snapATAC", "fisher")

p_value_permuted_label <- setNames(vector("list", length(methods_all)), methods_all)
p_value_actual_label <- setNames(vector("list", length(methods_all)), methods_all)
for (m in methods_all) {
  p_value_permuted_label[[m]] <- matrix(NA_real_, nrow = n_features_sample, ncol = n_repeat)
  p_value_actual_label[[m]] <- matrix(NA_real_, nrow = n_features_sample, ncol = n_repeat)
}

cells_sampled1_mat <- matrix(NA_integer_, nrow = n_cell_sample, ncol = n_repeat)
cells_sampled2_mat <- matrix(NA_integer_, nrow = n_cell_sample, ncol = n_repeat)
act_cells_sampled1_mat <- matrix(NA_integer_, nrow = n_cell_sample, ncol = n_repeat)
act_cells_sampled2_mat <- matrix(NA_integer_, nrow = n_cell_sample, ncol = n_repeat)
features_sampled_mat <- matrix(NA_integer_, nrow = n_features_sample, ncol = n_repeat)

for (iii in seq_len(n_repeat)) {
  act_cells_sampled1_mat[, iii] <- sample.int(ncol(p_by_c1), n_cell_sample, replace = FALSE)
  act_cells_sampled2_mat[, iii] <- sample.int(ncol(p_by_c2), n_cell_sample, replace = FALSE)

  all_cells <- sample.int(ncol(p_by_c), n_cell_sample * 2, replace = FALSE)
  cells_sampled1_mat[, iii] <- all_cells[1:n_cell_sample]
  cells_sampled2_mat[, iii] <- all_cells[(n_cell_sample + 1):(2 * n_cell_sample)]

  features_sampled_mat[, iii] <- sample.int(nrow(p_by_c), n_features_sample, replace = FALSE)
}

# ---------------------------
# 5. 主循环：重复评估 t1e 与 power
# ---------------------------
for (iii in seq_len(n_repeat)) {
  # --- null-like 场景（PT 内拆组）
  data_matrix_pos <- p_by_c[, cells_sampled1_mat[, iii]]
  data_matrix_neg <- p_by_c[, cells_sampled2_mat[, iii]]
  true_q_pos <- q_val[cells_sampled1_mat[, iii]]
  true_q_neg <- q_val[cells_sampled2_mat[, iii]]

  # --- actual 场景（PT vs LOH）
  act_data_matrix_pos <- p_by_c1[, act_cells_sampled1_mat[, iii]]
  act_data_matrix_neg <- p_by_c2[, act_cells_sampled2_mat[, iii]]
  act_true_q_pos <- q_val1[act_cells_sampled1_mat[, iii]]
  act_true_q_neg <- q_val2[act_cells_sampled2_mat[, iii]]

  # 特征子采样
  feature_idx <- features_sampled_mat[, iii]
  data_matrix_pos <- data_matrix_pos[feature_idx, ]
  data_matrix_neg <- data_matrix_neg[feature_idx, ]
  act_data_matrix_pos <- act_data_matrix_pos[feature_idx, ]
  act_data_matrix_neg <- act_data_matrix_neg[feature_idx, ]

  # PACS 输入：合并矩阵 + 二分类分组协变量
  group.info <- data.frame(group = c(rep(0, ncol(data_matrix_pos)), rep(1, ncol(data_matrix_neg))))
  data_mat <- Matrix(cbind(data_matrix_pos, data_matrix_neg), sparse = TRUE)
  rownames(data_mat) <- paste0("f_", seq_len(nrow(data_mat)))

  act_group.info <- data.frame(group = c(rep(0, ncol(act_data_matrix_pos)), rep(1, ncol(act_data_matrix_neg))))
  act_data_mat <- Matrix(cbind(act_data_matrix_pos, act_data_matrix_neg), sparse = TRUE)
  rownames(act_data_mat) <- paste0("f_", seq_len(nrow(act_data_mat)))

  p_value_permuted_label[["our"]][, iii] <- fn$pacs_test_sparse(
    covariate_meta.data = group.info,
    formula_full = ~ factor(group),
    formula_null = ~ 1,
    pic_matrix = data_mat,
    n_peaks_per_round = NULL,      # notebook 同样为 NULL（即让函数内部策略决定）
    T_proportion_cutoff = params$t_prop_cutoff,
    cap_rates = c(true_q_pos, true_q_neg)
  )$pacs_p_val

  p_value_actual_label[["our"]][, iii] <- fn$pacs_test_sparse(
    covariate_meta.data = act_group.info,
    formula_full = ~ factor(group),
    formula_null = ~ 1,
    pic_matrix = act_data_mat,
    n_peaks_per_round = NULL,
    T_proportion_cutoff = params$t_prop_cutoff,
    cap_rates = c(act_true_q_pos, act_true_q_neg)
  )$pacs_p_val

  # 其他基线方法（函数来自 PACS 包内部）
  n_reads_cell <- c(colSums(data_matrix_pos), colSums(data_matrix_neg))
  act_n_reads_cell <- c(colSums(act_data_matrix_pos), colSums(act_data_matrix_neg))

  p_value_permuted_label[["seurat"]][, iii] <- fn$seurat_method2_subsample(data_matrix_pos, data_matrix_neg, n_reads_cell)
  p_value_actual_label[["seurat"]][, iii] <- fn$seurat_method2_subsample(act_data_matrix_pos, act_data_matrix_neg, act_n_reads_cell)

  data_matrix_pos_bin <- data_matrix_pos; data_matrix_pos_bin@x[data_matrix_pos_bin@x != 0] <- 1
  data_matrix_neg_bin <- data_matrix_neg; data_matrix_neg_bin@x[data_matrix_neg_bin@x != 0] <- 1
  act_data_matrix_pos_bin <- act_data_matrix_pos; act_data_matrix_pos_bin@x[act_data_matrix_pos_bin@x != 0] <- 1
  act_data_matrix_neg_bin <- act_data_matrix_neg; act_data_matrix_neg_bin@x[act_data_matrix_neg_bin@x != 0] <- 1

  p_value_permuted_label[["snapATAC"]][, iii] <- fn$snapATAC_method(data_matrix_pos_bin, data_matrix_neg_bin, bcv = params$snap_bcv)
  p_value_actual_label[["snapATAC"]][, iii] <- fn$snapATAC_method(act_data_matrix_pos_bin, act_data_matrix_neg_bin, bcv = params$snap_bcv)

  p_value_permuted_label[["fisher"]][, iii] <- fn$fisher_method(data_matrix_pos_bin, data_matrix_neg_bin)
  p_value_actual_label[["fisher"]][, iii] <- fn$fisher_method(act_data_matrix_pos_bin, act_data_matrix_neg_bin)

  p_value_permuted_label[["archR"]][, iii] <- fn$archR_method(data_matrix_pos, data_matrix_neg)
  p_value_actual_label[["archR"]][, iii] <- fn$archR_method(act_data_matrix_pos, act_data_matrix_neg)
}

# ---------------------------
# 6. 统计 type-I error 与 power（与 notebook 一致）
# ---------------------------
t1power_mat <- matrix(NA_real_, nrow = length(methods_all), ncol = 5,
                      dimnames = list(methods_all, c("t1e", "t1e_sd", "power", "power_sd", "scenario")))
t1power_mat[, "scenario"] <- 1

for (jj in methods_all) {
  t1e_each_repeat <- colMeans(p_value_permuted_label[[jj]] < 0.05, na.rm = TRUE)
  t1power_mat[jj, "t1e"] <- mean(t1e_each_repeat, na.rm = TRUE)
  t1power_mat[jj, "t1e_sd"] <- sd(t1e_each_repeat, na.rm = TRUE)
}

pic_cut <- min(0.05, quantile(p_value_permuted_label[["our"]], 0.05, na.rm = TRUE))
pseu_cut <- min(0.05, quantile(p_value_permuted_label[["seurat"]], 0.05, na.rm = TRUE))
parch_cut <- min(0.05, quantile(p_value_permuted_label[["archR"]], 0.05, na.rm = TRUE))
psnap_cut <- min(0.05, quantile(p_value_permuted_label[["snapATAC"]], 0.05, na.rm = TRUE))
pfisher_cut <- min(0.05, quantile(p_value_permuted_label[["fisher"]], 0.05, na.rm = TRUE))

power_mat <- matrix(NA_real_, nrow = length(methods_all), ncol = n_repeat,
                    dimnames = list(methods_all, paste0("rep", seq_len(n_repeat))))

for (ii in seq_len(n_repeat)) {
  union_true <- p_value_actual_label[["our"]][, ii] < pic_cut |
    p_value_actual_label[["seurat"]][, ii] < pseu_cut |
    p_value_actual_label[["archR"]][, ii] < parch_cut |
    p_value_actual_label[["snapATAC"]][, ii] < psnap_cut

  denom <- sum(union_true, na.rm = TRUE)
  if (denom == 0) next

  power_mat["our", ii] <- sum(p_value_actual_label[["our"]][, ii] < pic_cut & union_true, na.rm = TRUE) / denom
  power_mat["seurat", ii] <- sum(p_value_actual_label[["seurat"]][, ii] < pseu_cut & union_true, na.rm = TRUE) / denom
  power_mat["archR", ii] <- sum(p_value_actual_label[["archR"]][, ii] < parch_cut & union_true, na.rm = TRUE) / denom
  power_mat["snapATAC", ii] <- sum(p_value_actual_label[["snapATAC"]][, ii] < psnap_cut & union_true, na.rm = TRUE) / denom
  power_mat["fisher", ii] <- sum(p_value_actual_label[["fisher"]][, ii] < pfisher_cut & union_true, na.rm = TRUE) / denom
}

t1power_mat[, "power"] <- rowMeans(power_mat, na.rm = TRUE)
t1power_mat[, "power_sd"] <- apply(power_mat, 1, sd, na.rm = TRUE)

print(t1power_mat)

# 保存结果，便于与 notebook 对比
saveRDS(list(
  params = params,
  p_value_permuted_label = p_value_permuted_label,
  p_value_actual_label = p_value_actual_label,
  t1power_mat = t1power_mat
), file = "pacs_kidney_partial_reproduction_result.rds")

cat("\n结果已保存到 pacs_kidney_partial_reproduction_result.rds\n")
