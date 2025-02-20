
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rutils

<!-- badges: start -->
<!-- badges: end -->

The rutils is library with a collection of helper functions aimed at
speeding up the routine processes

…

## Installation

You can install the development version of gdfR from
[gitlab](gdfgitlab.iabg.de) with:

``` r
devtools::install_git("https://github.com/DjanerEmin/rutils.git", git = "external")
```

If you wish to contribute open a new branch.

## Structure

There are four groups of functions in `rutils`. Three groups share a
common prefix for easier search and the forth group is a collection of
every other function. The groups are

- `path_` functions operate on a string and are useful to find query
  data, or construct new filenames for writing
- `sf_` functions operate on `sf` ([simple
  features](https://r-spatial.github.io/sf/)) objects.
- `r_`. **deprecated** are functions working on raster objects ([terra
  package](https://cran.r-project.org/web/packages/terra/index.html))

### The `path_` group

This group includes functions related to querying, editing, or creating
(file)paths and directories.

- `path_create()` - silently creates a folder structure
- `path_date()` - returns the date from a Sentinel-2 filename (TODO:
  make generic for any “datelike” patern)  
- `path_decompose()` `path_compose()` - (de)composes a filepath (into)
  from path, filename, extension
- `path_extract()` `path_insert()` - extracts(insert) a specific string
  based on separator pattern
- `path_find()` - recursive search inside folders
- `path_tifs()` - shorthand for `path_find(regexp = "tif$")`,
