GB/T 7714 BibTeX 文件说明
==========================

本目录随附 zepinglee/gbt7714-bibtex-style 上游项目 v3.1.1
（tag: v3.1.1，发布于 2026-09-27）的未修改文件，用于锁定旧版
GB/T 7714—2005 顺序编码制。官方仓库：
https://github.com/zepinglee/gbt7714-bibtex-style
固定来源文件：
https://github.com/zepinglee/gbt7714-bibtex-style/blob/v3.1.1/variants/gbt7714-2005-numeric.bst
https://github.com/zepinglee/gbt7714-bibtex-style/blob/v3.1.1/gbt7714-bst.dtx
https://github.com/zepinglee/gbt7714-bibtex-style/blob/v3.1.1/gbt7714-bst.ins

SHA-256（与本目录文件逐字节核对）：
gbt7714-2005-numeric.bst  f115052a81a087c4b033ce4fef7975f0f1b414b6a85bba817ea4cd3ab1efd7ed
gbt7714-bst.dtx            0a32f959de74c31ea9a9afe379bf9e2967186429a159bdfa3bd2b05d952e88bb
gbt7714-bst.ins            c724953eaec64516521c05190e1f335b3d72024a5746464c12f044be9e386ea7

`usc-thesis.cls` 显式调用 `gbt7714-2005-numeric`。当前上游 v3.1.1
使用 `-numeric` 新后缀；历史 v2.1.5 曾使用
`gbt7714-2005-numerical`。不要把无年份的 `gbt7714-numeric` 当作
2005 版，因为无年份样式随上游版本表示现行标准。

`references/references.bib` 文件开头的 `@GBT7714BSTCTL` 设置
`CTL_bib_punct = {half}` 只配置 BibTeX 的标点输出，未修改上游 bst，
也不是一条需要引用的文献。其余示例条目仅用于展示中英文、图书和标准
著录格式，交稿前应替换为真实来源。

上游三个文件版权属于 Zeping Lee，按 LPPL 1.3c 或更高版本分发，
许可证全文见工程根目录 LICENSE.txt。本目录 README 为本项目补充说明，
不改变上游版权或维护者身份。本项目保留来源、版本、版权和许可证信息。
