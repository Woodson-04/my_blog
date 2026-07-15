# 生物物理学

**主要内容**

>如何用热力学、统计物理、扩散随机过程、分子力学和信息论，解释 DNA、蛋白质、膜、分子马达、神经信号等生命现象。

**使用书籍**

[生物物理学：能量、信息、生命 (第2版), Philip Nelson, 2023](https://zlib.bz/book/6EOv0PV01d){:target="_blank"}

## 第I部分 谜、隐喻及模型

### 第1章 预备知识

#### 生命有序性之谜

当我们将墨汁滴入一杯水，墨汁最终混合均匀，这是直观的，一个孤立系统的分子无序性不可能自发降低。但即使最低等的细菌也充满精妙结构，似乎与物理系统总是趋于最大无序矛盾？

为克服"生机论"，观察事实需要与热力学第二定律调和，关键是**热力学第二定律只适用于孤立系统，而生命体显然并不孤立**。

生命不是简单地保持一个静态结构。它更像一个不断流动、不断更新的系统，远离平衡态，称为**非平衡稳态**(non-equilibrium steady state)，生命体通过利用整体系统自发趋于无序的能量流，用于维持自身局部低熵结构，远离平衡态死寂，通过物理自组装、遗传信息保留、自然选择、精细调控网络使得结构更加稳定。

<img src="https://my-blog-1355984362.cos.ap-shanghai.myqcloud.com/biophysics/%E5%9B%BE1.2.png" style="display: block; margin: 0 auto; max-width: 60%; height: auto;" />
<div style="text-align: center; margin: 20px 0;">
  <p style="color: #666; font-size: 0.9em;">(a)地球生物圈的能量预算。大部分入射能量降级为热能并辐射到宇宙空间，部分被捕获而创造生命体的有序性。(b)(c)植物、动物对能量的利用。</p>
</div>

**生命不是无中生有创造有序，而是捕获有序，有序根本来源于太阳**。

### 第2章 细胞内部结构一览

#### 一些生命体结构大小对比

物理人总是对数量级比较看重，要**掌握估测物理量数量级的能力**，这也是我大学第一门课力学课上景俊老师强调的。

<img src="https://my-blog-1355984362.cos.ap-shanghai.myqcloud.com/biophysics/%E5%9B%BE2.1.png" style="display: block; margin: 0 auto; max-width: 100%; height: auto;" />
<div style="text-align: center; margin: 20px 0;">
  <p style="color: #666; font-size: 0.9em;">一些生物体、生命单元的相对尺寸大小</p>
</div>

<img src="https://my-blog-1355984362.cos.ap-shanghai.myqcloud.com/biophysics/%E5%9B%BE2.2.png" style="display: block; margin: 0 auto; max-width: 90%; height: auto;" />
<div style="text-align: center; margin: 20px 0;">
  <p style="color: #666; font-size: 0.9em;">相对尺寸。(a)五个大肠杆菌细胞。(b)两个酵母细胞。(c)人的红细胞。(d)人的白细胞。(e)人的精子细胞。(f)人的表皮细胞。(g)人的视杆细胞。(h)人的横纹肌细胞(肌原纤维)。(i)人的神经元(神经细胞)。</p>
</div>

<div style="display: flex; justify-content: center; gap: 20px;">
  <img src="https://my-blog-1355984362.cos.ap-shanghai.myqcloud.com/biophysics/%E5%9B%BE2.3.png" width="55%">
  <img src="https://my-blog-1355984362.cos.ap-shanghai.myqcloud.com/biophysics/%E5%9B%BE2.4.png" width="40%">
</div>
<div style="text-align: center; margin: 20px 0;">
  <p style="color: #666; font-size: 0.9em;">左图：相对尺寸。(a)几种简单分子及大分子，对应右图。(b)大肠杆菌细胞，可视化结构包括细胞鞭毛、拟核、厚硬细胞壁。(c)人类免疫缺陷病毒(HIV)。(d)噬菌体。</p>
</div>

<div style="text-align: center; margin: 20px 0;">
  <p style="color: #666; font-size: 0.9em;">右图：几种分子相对尺寸。(a)碳原子。(b)葡萄糖分子。(c)ATP。(d)叶绿素分子。(e)转运RNA(tRNA)分子。(f)抗体。(g)核糖体。(h)脊髓灰质炎病毒。(i)肌球蛋白。(j)DNA。(k)F肌动蛋白。(l)参与糖酵解的十种酶。(m)丙酮酸脱氢酶。</p>
</div>

#### 细菌细胞分子成分及相应质量分数

<table class="three-line-table">

<thead>
<tr><th>分子类型</th><th>占细胞总质量的百分比(%)</th></tr>
</thead>

<tbody>
<tr><td><b>小分子</b></td><td><b>74</b></td></tr>
<tr><td class="indent">离子、其他无机小分子</td><td class="indent">1.2</td></tr>
<tr><td class="indent">糖类</td><td class="indent">1</td></tr>
<tr><td class="indent">脂肪酸</td><td class="indent">1</td></tr>
<tr><td class="indent">氨基酸单体</td><td class="indent">0.4</td></tr>
<tr><td class="indent">核苷单体</td><td class="indent">0.4</td></tr>
<tr><td class="indent">水</td><td class="indent">70</td></tr>

<tr><td><b>大、中型分子</b></td><td><b>26</b></td></tr>
<tr><td class="indent">蛋白质</td><td class="indent">15</td></tr>
<tr><td class="indent">RNA</td><td class="indent">6</td></tr>
<tr><td class="indent">DNA</td><td class="indent">1</td></tr>
<tr><td class="indent">脂</td><td class="indent">2</td></tr>
<tr><td class="indent">多聚糖</td><td class="indent">2</td></tr>
</tbody>

</table>

#### 中心法则的几处修正

宣称细胞所有可遗传特征完全由DNA决定，结论过于绝对。

1. 细胞整个状态，包括所有蛋白质和胞质中其它大分子，也会潜在影响子代细胞(表观遗传学)。

2. 细胞DNA本身可被永久或暂时改变，如随机点突变、随机复制删除、逆转录病毒(HIV)介导外源DNA插入等永久改变和甲基化等暂时改变。

3. RNA可编辑，成为mRNA合成与翻译间的中间阶段。

4. 多肽链可发生翻译后修饰，肽链上添加额外的化学基团。

## 第II部分 扩散、耗散及驱动

>热仅是分子随机运动

### 第3章 分子的舞蹈

#### 分子速度的总体分布是实验可测的

<img src="https://my-blog-1355984362.cos.ap-shanghai.myqcloud.com/biophysics/%E5%9B%BE3.6.png" style="display: block; margin: 0 auto; max-width: 90%; height: auto;" />
<div style="text-align: center; margin: 20px 0;">
  <p style="color: #666; font-size: 0.9em;">用速度筛选器测量分子速度分布的实验装置。筛选由两个带有狭缝的旋转圆盘构成，只有能满足穿过两个圆盘狭缝的特定速度分子可以被探测到。速度选定由调节圆盘转速实现。</p>
</div>

最终得到分子速度分布为**正态分布**，标准化正态分布后的“速度”平方和即“能量”，服从**卡方分布**。

#### 阿伦尼乌斯速率中的e指数从何而来

首先我们考虑水的热运动问题，我们知道表面水分子需要特定动能$E_{barrier}$才能摆脱液体完成逃逸，即逃逸需要活化势垒。假定我们加热一锅水，瞬间移走高能量分子，剩余分子就会重新形成平衡。

<img src="https://my-blog-1355984362.cos.ap-shanghai.myqcloud.com/biophysics/%E5%9B%BE3.8.png" style="display: block; margin: 0 auto; max-width: 90%; height: auto;" />
<div style="text-align: center; margin: 20px 0;">
  <p style="color: #666; font-size: 0.9em;">数学函数(麦克斯韦玻耳兹曼分布律)。(a)从初始100℃水中突然移走一些高能分子，后立即密封水。水分子速率分布从虚线转变为实线。新的分布再次形成高能尾部，但最高峰适度减少。(b)同一系统，逃逸速度相同，但初始温度更高，截取高能尾部更多，峰的移动变化更显著。</p>
</div>

以上模型可以解释水温越高，蒸发越快。而这一模型中我们瞬时移走水分子的比例即能量超过$E_{barrier}$的比例，而我们已经知道动能服从尺度变换后的卡方分布，速率分布服从麦克斯韦玻耳兹曼分布律，故可求得瞬时移走水分子比例以$e^{-E_{barrier}/k_{B}T}$的形式依赖于温度。

类似地，假定一个物质中很多分子自由碰撞，一个分子贮存能量，仅当对它最小撞击高于一个活化能垒时释放能量。如果大部分碰撞转移能量小于能垒，分子几乎稳定。但加热可以促进碰撞能量增加，增大反应速率。**将反应看做瞬间的移走水分子，则瞬时反应分子比例即表示反应速率(实则根据物质的量乘以系数)**于是反应速率以$e^{-E_{barrier}/k_{B}T}$的形式依赖于温度。于是得到了**阿伦尼乌斯速率定律**。

>**阿伦尼乌斯速率定律**：简单化学反应的速率以$e^{-E_{barrier}/k_{B}T}$的形式依赖于温度，其中$E_{barrier}$是化学反应中与温度无关的特征常量。

#### 遗传信息有物质载体吗？多大？什么形状？

在20世纪初，遗传因子尚只是逻辑产物，而非物理实体。摩尔根和他的助手想到了染色体，通过对果蝇遗传连锁现象的观察分析、统计推断得出结论：**遗传信息载体是染色体；不管染色体究竟是什么物质，它们肯定是链状的**

那些染色体上携带因子的单位，被命名为基因。不过这种物质**到底有多大(是否分子尺度)、主要成分是什么**都还不知道

基因的确是分子尺度的，马勒在1935年估计了基因的大小:果蝇染色体有丝分裂期凝聚为长$2μm$、直径$0.25μm$的圆柱体，故遗传物质总体积小于等于$2μm×π(0.25μm/2)^{2}$；染色体在伸展时长度很可能超过$200μm$，假设直径$d$，则可得直径$d≤0.025μm$。这表明基因的确是分子尺度的物体(当然目前我们知道不及这个上界的十分之一)。

这一结论暗含某些东西使薛定谔震惊，因为分子永不停息热运动，纸上文字稳定存在多年，但若字只有几纳米大，墨水分子的随机运动将很快使字迹模糊。

>空间尺度越小，随机运动对有序结构就越有破坏性。

为什么基因如此小却如此稳定？这导向基因不仅仅是分子尺度的，而且**很可能是单分子**(化学键键能$E_{bond}≈2.4×10^{-19}$，大约是典型热能$E_{thermal}$的60倍)。

这一结果在今天令人满意、显然，但那时候仍需要利用模型做一点定量验证。

<img src="https://my-blog-1355984362.cos.ap-shanghai.myqcloud.com/biophysics/%E5%9B%BE3.15.png" style="display: block; margin: 0 auto; max-width: 80%; height: auto;" />
<div style="text-align: center; margin: 20px 0;">
  <p style="color: #666; font-size: 0.9em;">季莫菲耶夫的一些关于X射线诱变的原始实验数据。果蝇培养皿暴露在γ射线或X射线下，得到突变率随照射量变化。(\(1伦琴=2×10^{12}个电离对/cm^{3}\))</p>
</div>

马勒和季莫菲耶夫发现了突变频率与辐射剂量的线性相关性，且**不同种类辐射诱导突变的效果是相同的**。

年轻物理学家德尔布鲁克对辐射诱导突变进行建模，得出模型:$突变概率=P_{1}c_{*}v=(P_{1}Kv)×c_{ion}$

他的论断意味着**基因单分子的合理性**，单次分子碰撞就能打断基因，从而突变概率等于常数乘以辐射量。综合以上研究发现，**遗传物质载体被认为是一个长链单分子或高分子**，在当时长链分子刚提出且具有争议的背景下十分大胆。

薛定谔总结知识后提出问题：**如果基因是一个分子，那应该是位于细胞核内众多大分子中的哪一种呢？如果有丝分裂包含这一分子的复制，又是如何进行的呢？**。这就是后面沃森、克里克的故事了。

#### 海拔影响$O_{2}$比例

>海平面高度大气层大约78个氮分子对应21个氧分子（即氮氧分子数比约为 \(78:21\)）。假定不同海拔高度温度恒定，求海拔 \(10\,\text{km}\) 处氮氧分子数比例。

假设大气处于等温静力平衡态，分子数密度随高度服从玻尔兹曼分布：$n(h)=n(0)\exp\left(-\frac{mgh}{kT}\right)$

其中 \(m\) 为分子质量，\(g\) 为重力加速度，\(k\) 为玻尔兹曼常数，\(T\) 为绝对温度。

对于两种气体，其数密度之比为：
$\frac{n_{N_2}(h)}{n_{O_2}(h)}=\frac{n_{N_2}(0)}{n_{O_2}(0)}\cdot
\frac{\exp(-m_{N_2}gh/kT)}{\exp(-m_{O_2}gh/kT)}=\frac{n_{N_2}(0)}{n_{O_2}(0)}\cdot
\exp\left(\frac{(m_{O_2}-m_{N_2})gh}{kT}\right)$

将分子质量用摩尔质量 \(M\) 表示（\(m = M/N_A\)，\(k = R/N_A\)），得：
$\frac{n_{N_2}(h)}{n_{O_2}(h)}=R_0 \cdot\exp\left(\frac{(M_{O_2}-M_{N_2})gh}{RT}\right)$

其中海平面初始比值：$R_0 = \frac{78}{21} \approx 3.7143$

代入已知数据：

- 摩尔质量差：\(M_{O_2}=32\times10^{-3}\,\text{kg/mol}\)，\(M_{N_2}=28\times10^{-3}\,\text{kg/mol}\) \(\Delta M = 4\times10^{-3}\,\text{kg/mol}\)
- 重力加速度：\(g = 9.8\,\text{m/s}^2\)
- 高度：\(h = 10\,000\,\text{m}\)
- 气体常数：\(R = 8.314\,\text{J/(mol·K)}\)
- 等温温度（取标准大气温度）：\(T = 288\,\text{K}\)

计算指数因子：
$\alpha = \frac{\Delta M \cdot g \cdot h}{R T} = \frac{0.004 \times 9.8 \times 10000}{8.314 \times 288}\approx 0.1637$，故$e^{\alpha} = e^{0.1637} \approx 1.1779$

于是：$\frac{n_{N_2}(10\text{km})}{n_{O_2}(10\text{km})}=3.7143 \times 1.1779\approx 4.3743$


**结果**：海拔 \(10\,\text{km}\) 处，氮氧分子数比例约为：$\boxed{4.37 : 1}$

!!! info "补充说明(现实大气)"
    实际地球大气中，对流层内强烈的湍流和对流混合远强于重力分异，因此直到约 \(100\,\text{km}\) 以下，大气组分基本保持均匀。在真实 \(10\,\text{km}\) 高度，氮氧比例仍接近于 \(78:21\)。

### 第4章 无规行走、摩擦及扩散

### 第5章 慢航道中的生命：小雷诺数世界

### 第6章 熵、温度与自由能

### 第7章 细胞内的熵力

### 第8章 化学力和自组装

## 第III部分 分子、机器、工作机制

### 第9章 大分子的协同变构

### 第10章 酶与分子机器

### 第11章 嵌膜机器

### 第12章 神经冲动