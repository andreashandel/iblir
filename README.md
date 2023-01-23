
<!-- README.md is generated from README.Rmd. Please edit that file -->

# iblir - Introductory Biostatistics Labs in R <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/andreashandel/iblir/workflows/R-CMD-check/badge.svg)](https://github.com/andreashandel/iblir/actions)
[![test-coverage](https://github.com/andreashandel/iblir/workflows/test-coverage/badge.svg)](https://github.com/andreashandel/iblir/actions)
[![Codecov
coverage](https://codecov.io/gh/andreashandel/iblir/branch/main/graph/badge.svg)](https://codecov.io/gh/andreashandel/iblir?branch=main)
[![Codecov test
coverage](https://codecov.io/gh/andreashandel/iblir/branch/main/graph/badge.svg)](https://codecov.io/gh/andreashandel/iblir?branch=main)
<!-- badges: end -->

**This package is still under active development. If you see this
message, assume that several parts of the package don’t quite work
yet.**

## Description

`iblir` is an R package containing a set of
[`learnr`](https://rstudio.github.io/learnr/)/Shiny tutorials that cover
basic biostatistical concepts.

## Information for users

### Getting Started

Start by installing R and RStudio. The package is not yet on CRAN, so
you need to install it from GitHub as follows.

    install.packages('remotes')
    library('remotes')
    install_github('andreashandel/iblir')

Then load the package

    library('iblir')

To start the tutorials/labs, you type

    run_tutorial('LabN', package = 'iblir')

where N is the lab number (1-13), e.g., `Lab1`, `Lab2`.

A startup message also tells you this.

### Further information

See the **Getting started** tutorial/vignette for additional
information.

## Information for teachers

See the **Getting started** tutorial/vignette for some brief information
on different ways the package can be used and deployed for teaching.

## Information for developers

See the **Getting started** tutorial/vignette for some brief information
on different ways to add labs or modify the content of existing labs.

## Citation and Contributors

The main content of this package was developed by [Brian
McKay](https://brianmckay.netlify.app/). The package is maintained by
[Brian McKay](https://brianmckay.netlify.app/) and [Andreas
Handel](https://www.andreashandel.com/). A full list of contributors and
a Bibtex entry for the citation [can be found
here](https://andreashandel.github.io/iblir/authors.html).
