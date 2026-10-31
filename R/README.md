# 一键更新网站数据

在项目根目录的 R / RStudio 中运行：

```r
source("R/update_all.R")
```

也可以从其他目录使用绝对路径：

```r
source("/Users/xiaotaoshen/github/jaspershen-lab/R/update_all.R")
```

默认自动按顺序执行：

1. 新增 Google Scholar 论文，更新已有论文引用数。
2. 更新年度论文数与引用数（`static/data/publication_summary.json`）。
3. 根据本地论文更新关键词（`data/publication_keywords.json`）。
4. 更新合作者地图（`static/data/collaborator_city_map.json` 及原始 CSV），沿用现有 OpenAlex fallback。

需要联网；合作者地图可能耗时较长。缺少 R 包时会给出安装命令，不会自动安装。某一步出错会停止并说明步骤；已经成功写入的内容不会自动回滚，请检查 Git diff 后再提交。

`build.R` 和 `build2.R` 目前只有注释，不包含实际更新工作。入口不运行 Hugo，不提交或推送 Git。

如果只想加载函数，或希望更改参数：

```r
options(shenlab.update_all.autorun = FALSE)
source("R/update_all.R")
update_all(scholar_url = "3TK9yz8AAAAJ", max_pubs = 200)
# 恢复以后 source 时自动运行：
options(shenlab.update_all.autorun = TRUE)
```

离线测试（不抓取线上数据、不改写网站内容）：

```sh
Rscript tests/test-update-all.R
```
