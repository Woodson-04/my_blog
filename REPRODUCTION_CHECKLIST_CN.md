# PACS 论文复现建议（基于作者 GitHub）

本清单基于 PACS 官方仓库与官方文档，结合当前 `reproduce_kidney_partial.R` 脚本给出。

## 1) 先满足运行环境

1. R 建议版本 `> 4.0.0`（官方说明）。
2. 安装依赖（先 PICsnATAC，再 PACS）。
3. 能够正常 `library(PACS)` 且 `packageVersion("PACS")` 可读。

> 官方安装入口：<https://zhen-miao.github.io/PACS/> 以及 <https://github.com/Zhen-Miao/PACS>

## 2) 对齐数据与 notebook 输入

`Notebook_1_Test_For_Sens_Spec_real_kidney_data.ipynb` 的关键输入是：
- `kidney_features_to_keep.rds`
- `data_for_test_for_t1e_power.rdata`（包含 `pmats`, `x.sp_cluster2`）
- `r_by_ct_est_kidney_adult.rds`（包含 `q_vec_new`）

脚本默认目录已改为：
- `/home/woodson/biostatistic/pacs/PACS_data`

若该目录不存在，脚本会回退到当前工作目录并告警。

## 3) 论文“部分复现”应先通过的最小测试

建议按顺序执行：

1. **语法测试**：`Rscript -e "parse(file='reproduce_kidney_partial.R')"`
2. **包与函数可用性测试**：`Rscript -e "library(PACS); ls('package:PACS')[1:10]"`
3. **小规模冒烟测试**：将脚本中参数改成 `n_repeat=1, n_cell_sample=100, n_features_sample=1000`，确认能跑通。
4. **正式参数运行**：恢复 `n_repeat=5, n_cell_sample=500, n_features_sample=10000`。
5. **结果文件检查**：确认生成 `pacs_kidney_partial_reproduction_result.rds` 并包含 `t1power_mat`。

## 4) 如何从“部分复现”走向“论文复现”

你当前脚本复现的是官方 Notebook 1（真实 kidney 数据 type-I error/power 评估）的一部分。若要更接近论文完整复现，建议：

1. 对齐 PACS 仓库中所有 analysis notebook / scripts（尤其与 Figure 3g-h、Figure 4 对应部分）。
2. 固定软件版本（R、PACS、PICsnATAC、Bioconductor 包）并记录 sessionInfo。
3. 对每个 figure 生成单独脚本与输出目录，避免覆盖。
4. 记录随机种子与采样 index（当前脚本已固定 seed=3384）。
5. 增加结果一致性断言（如 t1e 是否接近论文/官方 notebook 的数量级）。

## 5) 当前可能的卡点（需优先排查）

1. PACS 不同版本中内部函数是否仍叫：
   - `seurat_method2_subsample`
   - `snapATAC_method`
   - `fisher_method`
   - `archR_method`
2. 输入数据对象结构是否与 notebook 年代一致。
3. 运行机器内存（10k peaks × 1000 cells × 多次重复）是否足够。

---
如果你愿意，我下一步可以直接把这份清单转成一个**一键执行脚本**（先做环境检查，再做小样本冒烟，再做正式跑），并自动导出日志与 sessionInfo。
