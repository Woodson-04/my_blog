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

### 第3章 分子的舞蹈

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