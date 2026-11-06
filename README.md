# USC-Master-Thesis-LaTeX（南华大学学术硕士学位论文模板）

这是我个人参考南华大学研究生学位论文要求制作的 **非官方 LaTeX 模板**，适用于学术学位硕士论文写作。项目未经学校认证，提交论文前请结合所在学院的最新要求核对。

格式依据为随附的《南华大学研究生学位论文的基本要求和书写规范》Word 文件：[研究生院官方入口](https://yjs.usc.edu.cn/info/1416/11000.htm)。网页发布于 2023 年，附件内部仍标注 2015 年，因此本项目不称为学校最新官方模板。

**[查看论文排版效果（PDF）](main.pdf)** · **[下载学校要求（Word）](%EF%BC%882023%EF%BC%89%E5%85%B3%E4%BA%8E%E4%BD%BF%E7%94%A8%E3%80%8A%E5%8D%97%E5%8D%8E%E5%A4%A7%E5%AD%A6%E7%A0%94%E7%A9%B6%E7%94%9F%E5%AD%A6%E4%BD%8D%E8%AE%BA%E6%96%87%E7%9A%84%E5%9F%BA%E6%9C%AC%E8%A6%81%E6%B1%82%E5%92%8C%E4%B9%A6%E5%86%99%E8%A7%84%E8%8C%83%E3%80%8B%E7%9A%84%E9%80%9A%E7%9F%A5.doc)**

## 文件说明

```text
main.tex                    编译入口，组织论文各部分的顺序
main.pdf                    随附的论文排版效果预览
thesis-setup.tex             填写题目、作者、导师、专业等信息
usc-thesis.cls              文档类，集中定义版式和论文专用命令
frontmatter/                前置内容
  abstract-cn.tex           中文摘要与关键词
  abstract-en.tex           英文摘要与关键词
  symbols.tex               符号说明，可按需取消
chapters/                   正文章节
  01-introduction.tex       绪论
  02-methods.tex            研究方法及图表、公式示例
  03-results.tex            结果与讨论、交叉引用示例
  04-conclusions.tex        结论
backmatter/                 后置内容
  appendix-a.tex            附录与跨页表格示例
  achievements.tex          攻读学位期间的科研成果
  acknowledgements.tex      致谢
references/
  references.bib            参考文献数据库
  gbt7714/                  GB/T 7714—2005 样式、上游源文件及来源说明
assets/                     校名字样原图和供编译使用的 PDF 图片资源
docs/                       规范对照、歧义处理与参考项目说明
latexmkrc                   项目编译配置
build.cmd                   Windows 双击编译
LICENSE.txt                 LPPL 1.3c 许可证
```

正文目前以“正文”等文字占位；英文摘要、图表、公式及文献记录也只是排版示例，写作时应替换为自己的真实内容。通常修改信息设置、摘要、章节和文献库即可，无需改动文档类。

## 编译与使用

安装包含所需宏包的 TeX Live，确保 `xelatex`、`latexmk`、`bibtex` 可用。在项目根目录运行：

```sh
latexmk -norc -r latexmkrc -cd main.tex
```

Windows 也可双击 `build.cmd`。编译使用 XeLaTeX，参考文献由 BibTeX 处理；PDF 与 SyncTeX 输出到主文件目录，中间文件进入 `auxiliary/`。入口可改名，整体移动时保留目录关系；双击脚本要求根目录只有一个使用本类的论文入口。

默认字体为 SimSun、SimHei、KaiTi 和 Times New Roman，需自行合法安装。没有这些字体时可使用 `fonts=fandol` 预览，但字形与分页不保证相同。

```latex
\documentclass[fonts=system,frontnumbering=all]{usc-thesis}
```

`frontnumbering=all` 按前置部分连续编罗马页码；`frontnumbering=abstract` 改为摘要从 I 开始。两种设置对应原规范文字与示例的起点歧义。`blind=true` 仅提供基础匿名，正文、图表、成果及学校标识仍须按送审要求人工检查。

添加章节时在主文件加入 `\input{chapters/文件名}`；编号公式使用 `uscequation`，保留规范要求的点引导线。文献库开头的 `@GBT7714BSTCTL` 是标点配置，请保留。

本仓库保留 `main.pdf` 作为效果预览，并随附学校要求 Word；SyncTeX、日志和编译缓存不上传。`assets/usc-logo.pdf` 是必需的静态输入图片。修改源码后请重新编译，预览 PDF 不会自动更新。

## 参考与许可

工程组织参考 [ThuThesis](https://github.com/tuna/thuthesis)、[USTCThesis](https://github.com/ustctug/ustcthesis) 和 [SJTUThesis](https://github.com/sjtug/SJTUThesis)；中文排版使用 [CTeX](https://github.com/CTeX-org/ctex-kit)，文献样式使用 [gbt7714](https://github.com/zepinglee/gbt7714-bibtex-style)。具体来源与规范差异见 [规范对照与参考](docs/规范对照与参考.txt)，随附样式的版本和版权见 [第三方说明](references/gbt7714/README.txt)。

原创代码采用 LPPL 1.3c 或更高版本，当前维护者为 USC Thesis Template contributors。第三方代码保留原版权与许可证；学校原文件、校名、校徽和声明文本的权利归原权利人，不属于本代码许可证的授权范围。
