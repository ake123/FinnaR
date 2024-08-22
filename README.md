# FinnaR

[![issues](https://img.shields.io/github/issues/ake123/FinnaR)](https://github.com/ake123/FinnaR/issues)
[![pulls](https://img.shields.io/github/issues-pr/ake123/FinnaR)](https://github.com/ake123/FinnaR/pulls)
[![R-CMD-check](https://github.com/ake123/FinnaR/workflows/rworkflows/badge.svg)](https://github.com/ake123/FinnaR/actions)
[![codecov](https://codecov.io/gh/ake123/FinnaR/branch/devel/graph/badge.svg)](https://app.codecov.io/gh/ake123/FinnaR?branch=devel)
[![codefactor](https://www.codefactor.io/repository/github/ake123/FinnaR/badge)](https://www.codefactor.io/repository/github/ake123/FinnaR)

The goal of FinnaR is to retrieve data from Finna API 

## Installation instructions
The devel version of FinnnaR can be installed from GitHub as follows:

```
remotes::install_github("ake123/FinnaR")
```

## Example
The basic functionality of FinnaR can be explored as follows:

```
# Load the package
library(FinnaR)

# Perform a simple search and print a table
record <- search_finna("sibelius")
record <-as.data.frame(search_record)
knitr::kable(head(record))
```
| Title                                                 | Author                | Year | Language   | Formats | Subjects | Library | Series
|:---------------------------------------------------------------------------------------------|:-----------------|:--------|:--------------------|:----------------------------|:-----------|:---------|--------:|----------:|
| 1 Sibelius favourites : Sibelius conducts Sibelius    | Sibelius, Jean        | 2001    | NA       | Äänite, CD  | orkesterimusiikki, Suomi  | Lapin kirjasto, Kemi, Kemin kirjasto | NA    
| 2 SIBELIUS                                            | TAWASTSTJERNA, ERIK   | 1997    | fin      | Kirja, Kirja  | SIBELIUS  | Anders-kirjastot, Ullava | NA    
| 3 Sibelius                                            | Tawaststjerna, Erik, Anhava, Tuomas, Heikinheimo, Seppo, Salmenhaara, Erkki  | 1997    | fin      | Kirja, Kirja  | Sibelius, Jean.; 1800-luku; 1900-luku; säveltäjät; elämäkerrat; henkilöhistoria; Suomi  | Anders-kirjastot, Kokkola, Kannu | NA    
| 4 Sibelius                                            | Lampila, Hannu-Ilari  | 1984    | fin      | Kirja, Kirja  | Sibelius, Jean.  | Helka-kirjastot, Suomalaisen Kirjallisuuden Seura | NA    
| 5 Sibelius                                            | Tawaststjerna, Erik, Tawaststjerna, Erik T., Anhava, Tuomas, Heikinheimo, Seppo  | 2003    | fin      | Kirja, Kirja  | 5 Sibelius, Jean,, 1865-1957.; 1900-luku; 1800-luku; 1800-talet; 1900-talet; Composers, Finland, biography.; säveltäjät; henkilöhistoria; taidemusiikki; kompositörer; personhistoria; konstmusik; Suomi; Järvenpää; Finland; Träskända
  | Kansalliskirjasto, Arto | NA    
| 6 Sibelius                                            | Ringbom, Nils-Eric, Jalas, Margareta, suom  | 1948    | fin      | Kirja, Kirja  | Sibelius, Jean.  | Kirkes-kirjastot, Tuusula, Järvenpää, Tuusulan pääkirjasto, Järvenpään kirjasto, 1, 1 | NA 


## Code of Conduct
Please note that the FinnaR project is released with a
[Contributor Code of Conduct](Link).
By contributing to this project, you agree to abide by its terms. Contributions
are welcome in the form of feedback, issues and pull requests. You can find the
contributor guidelines of the FinnaR
[here]().

## Acknowledgements
Please note that FinnaR was only made possible thanks to many other R and
rOpenGov software authors, which are cited in the vignettes describing
this package.

This package was developed using the following resources:

- [_usethis_](https://cran.r-project.org/web/packages/usethis/) to generate an
  initial template.
- Continuous code testing is performed on
  [GitHub actions](https://github.com/features/actions) and include R CMD check,
- Code coverage assessment is possible thanks to
  [codecov](https://app.codecov.io/gh/).
- The documentation website is automatically updated thanks to
  [_pkgdown_](https://cran.r-project.org/web/packages/pkgdown/).
- The documentation is formatted thanks to
  [_devtools_](https://cran.r-project.org/web/packages/devtools/) and
  [_roxygen2_](https://cran.r-project.org/web/packages/roxygen2/).

### Disclaimer

This package is in no way officially related to or endorsed by Finna.

When using data retrieved from Finna database in your work, please
indicate that the data source is Finna. If your re-use involves some
kind of modification to data or text, please state this clearly to the
end user. See Finna policy on [copyright and free re-use of
data](https://www.finna.fi/Content/terms?lng=en-gb) for more
detailed information and certain exceptions.
