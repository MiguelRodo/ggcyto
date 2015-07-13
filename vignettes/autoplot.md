# Quick plot for cytometry data




```r
library(ggcyto)
dataDir <- system.file("extdata",package="flowWorkspaceData")
gs <- load_gs(list.files(dataDir, pattern = "gs_manual",full = TRUE))
data(GvHD)
fs <- GvHD[subset(pData(GvHD), Patient %in%5 & Visit %in% c(5:6))[["name"]]]
```

## `flowSet`

```r
## 1d densityplot
autoplot(fs, x = 'FSC-H')
```

![](autoplot_files/figure-html/unnamed-chunk-3-1.png) 

```r
## 2d hex
autoplot(fs, x = 'FSC-H', y = 'SSC-H', bins = 64)
```

![](autoplot_files/figure-html/unnamed-chunk-3-2.png) 

## `GatingSet` 

```r
# apply the instrument range by default
# use direct parent
# inverse trans axis
autoplot(gs, "CD3+", bins = 64)
```

![](autoplot_files/figure-html/unnamed-chunk-4-1.png) 

```r
# multiple
autoplot(gs, c("CD4", "CD8"), bins = 64)
```

![](autoplot_files/figure-html/unnamed-chunk-4-2.png) 

## `GatingHierarchy`

```r
gh <- gs[[1]]
nodes <- getNodes(gh, path = "auto")[c(3:9, 14)]
nodes
```

```
## [1] "singlets"    "CD3+"        "CD4"         "CD4/38- DR+" "CD4/38+ DR+"
## [6] "CD4/38+ DR-" "CD4/38- DR-" "CD8"
```

```r
# default use grid.arrange
autoplot(gh, nodes, bins = 64)
```

![](autoplot_files/figure-html/unnamed-chunk-5-1.png) 

```r
# disable arrange and receive a list of ggplot objects to manually arrange
objs <- autoplot(gh, nodes, bins = 64, arrange = F)
length(objs)
```

```
## [1] 4
```

```r
class(objs[[1]])
```

```
## [1] "gg"     "ggplot"
```

```r
class(objs[[2]])
```

```
## [1] "gg"     "ggplot"
```
