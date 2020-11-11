
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xaringanPrinter

<!-- badges: start -->

<!-- badges: end -->

The goal of xaringanPrinter is to provide an easy interface to convert
xaringan (remark.js) slides to other formats.

remark.js slides aren’t self contained, and sometimes it’s not ideal, so
you might want to convert of pdf. The function slides\_pdf is just a
wrapper for chrome\_print from pagedown.

You might also want a gif preview of slides. You can do this with
slides\_gif(). Under the hood, we do this by converting html slides to
pdf, then the pdf pages to images, and the images to a gif.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
remotes::install_github("EvaMaeRey/xaringanPrinter")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(xaringanPrinter)
## basic example code
```

``` r
slides_gif(input = "my_slideshow.html", output = "a_folder/my_slideshow.gif")
```

This will produce “my\_slideshow.gif” in “a\_folder”.
