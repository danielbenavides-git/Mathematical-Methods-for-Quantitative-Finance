
<!-- rnb-text-begin -->

---
title: "Testing the Random Walk"
author: "Paul F. Mende"
date: "Summer 2021"
output: 
  html_notebook:
  df_print: paged
  toc: yes
---

*Notebooks in R Markdown*:
This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code. 

Try executing a code chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*. 


Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).

# Preliminaries

Before we get started, let's install a few **packages**.

- The `install.packages` command is run **once** to download the software to your computer.
- The `library` command is run **one time per session** in order to load a packages functions and make them available.

If you have never installed them, uncomment the lines in the block below and run it one time.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVJMmx1YzNSaGJHd3VjR0ZqYTJGblpYTW9YQ0owYVdSNWRtVnljMlZjSWlrZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSXlCVWJ5QnBibk4wWVd4c0lHRWdjMmx1WjJ4bElIQmhZMnRoWjJWY2JpTnBibk4wWVd4c0xuQmhZMnRoWjJWektGd2lkR2xrZVhGMVlXNTBYQ0lwSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ01nVkc5dmJITWdabTl5SUhGMVlXNTBJR1pwYm1GdVkyVmNiaU5wYm5OMFlXeHNMbkJoWTJ0aFoyVnpLR01vWENKMmNuUmxjM1JjSWl4Y0ltZG5jR3h2ZERKY0lpa3BJQ0FnSUNBZ0l5QkJaR1JwZEdsdmJtRnNJSEJoWTJ0aFoyVnpJR1p2Y2lCV1lYSnBZVzVqWlNCU1lYUnBiM01nWVc1a0lHWnZjaUJ3Ykc5MGRHbHVaMXh1WUdCZ1hHNWNibUJnWUNKOSAtLT5cblxuYGBgclxuI2luc3RhbGwucGFja2FnZXMoXCJ0aWR5dmVyc2VcIikgICAgICAgICAgICAgICAgIyBUbyBpbnN0YWxsIGEgc2luZ2xlIHBhY2thZ2VcbiNpbnN0YWxsLnBhY2thZ2VzKFwidGlkeXF1YW50XCIpICAgICAgICAgICAgICAgICMgVG9vbHMgZm9yIHF1YW50IGZpbmFuY2VcbiNpbnN0YWxsLnBhY2thZ2VzKGMoXCJ2cnRlc3RcIixcImdncGxvdDJcIikpICAgICAgIyBBZGRpdGlvbmFsIHBhY2thZ2VzIGZvciBWYXJpYW5jZSBSYXRpb3MgYW5kIGZvciBwbG90dGluZ1xuYGBgXG5cbmBgYFxuXG48IS0tIHJuYi1zb3VyY2UtZW5kIC0tPlxuIn0= -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuI2luc3RhbGwucGFja2FnZXMoXCJ0aWR5dmVyc2VcIikgICAgICAgICAgICAgICAgIyBUbyBpbnN0YWxsIGEgc2luZ2xlIHBhY2thZ2VcbiNpbnN0YWxsLnBhY2thZ2VzKFwidGlkeXF1YW50XCIpICAgICAgICAgICAgICAgICMgVG9vbHMgZm9yIHF1YW50IGZpbmFuY2VcbiNpbnN0YWxsLnBhY2thZ2VzKGMoXCJ2cnRlc3RcIixcImdncGxvdDJcIikpICAgICAgIyBBZGRpdGlvbmFsIHBhY2thZ2VzIGZvciBWYXJpYW5jZSBSYXRpb3MgYW5kIGZvciBwbG90dGluZ1xuYGBgXG5cbmBgYCJ9 -->

```r
#install.packages("tidyverse")                # To install a single package
#install.packages("tidyquant")                # Tools for quant finance
#install.packages(c("vrtest","ggplot2"))      # Additional packages for Variance Ratios and for plotting
```

```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiRXJyb3I6IGF0dGVtcHQgdG8gdXNlIHplcm8tbGVuZ3RoIHZhcmlhYmxlIG5hbWVcbiJ9 -->

```
Error: attempt to use zero-length variable name
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


Now we'll load packages.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVZR0JnZTNJZ2JHOWhaR2x1WjMxY2JseHVZR0JnSW4wPSAtLT5cblxuYGBgclxuYGBge3IgbG9hZGluZ31cblxuYGBgXG5cbjwhLS0gcm5iLXNvdXJjZS1lbmQgLS0+XG4ifQ== -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBge3IgbG9hZGluZ31cblxuYGBgIn0= -->

```r
```{r loading}

```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiRXJyb3I6IGF0dGVtcHQgdG8gdXNlIHplcm8tbGVuZ3RoIHZhcmlhYmxlIG5hbWVcbiJ9 -->

```
Error: attempt to use zero-length variable name
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


# Tootsie Roll

Let's load some data and look at default summary stats for data from Tootsie Roll (TR).  The file TR.csv contains daily prices, adjusted for splits and dividends, from Yahoo Finance.  (Tootsie Roll actually has an unusual stock dividend history.  By using the Adjusted Close data, we don't need to worry about those details for now.)

**Technical note:** Data is often exchanged using "flat files," which are plain text files that can be read using a simple text editor.  Although they are usually structured, format details can differ; so it's essential to pay attention to elements that might vary from one source to another such as

- Column headers (yes/no, naming conventions)
- Line breaks (CR, LF, CR/LF)
- Delimiters
- Escape characters
- Ordering
- Data types (integer/float, text/numeric)
- Date formatting (YMD, MDY, %Y/%y, etc.)
- Data errors!

Advice: don't take anything for granted.  Check your data!


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVJeUJTWldGa0lHbHVJR1JoZEdFZ1ptbHNaU0F0TFNCelpYUWdlVzkxY2lCdmQyNGdiRzlqWVd3Z1pHbHlaV04wYjNKNUlHWnZjaUJtYVd4bElHeHZZMkYwYVc5dVhHNWNiaU1qSXlCVVVpQThMU0J5WldGa1gyTnpkaWhjSW40dmRHMXdMMVJTTG1OemRsd2lLVnh1WEc1Z1lHQWlmUT09IC0tPlxuXG5gYGByXG4jIFJlYWQgaW4gZGF0YSBmaWxlIC0tIHNldCB5b3VyIG93biBsb2NhbCBkaXJlY3RvcnkgZm9yIGZpbGUgbG9jYXRpb25cblxuIyMjIFRSIDwtIHJlYWRfY3N2KFwifi90bXAvVFIuY3N2XCIpXG5cbmBgYFxuXG48IS0tIHJuYi1zb3VyY2UtZW5kIC0tPlxuIn0= -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIyBSZWFkIGluIGRhdGEgZmlsZSAtLSBzZXQgeW91ciBvd24gbG9jYWwgZGlyZWN0b3J5IGZvciBmaWxlIGxvY2F0aW9uXG5cbiMjIyBUUiA8LSByZWFkX2NzdihcIn4vdG1wL1RSLmNzdlwiKVxuXG5gYGAifQ== -->

```r
# Read in data file -- set your own local directory for file location

### TR <- read_csv("~/tmp/TR.csv")

```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVYRzVjYmlNZ1JHVm1hVzVsSUhGMVpYSjVJSEJoY21GdFpYUmxjbk5jYm5ScFkydGxjaUE4TFNCY0lsUlNYQ0pjYm1SaGRHVmZabWx5YzNRZ1BDMGdYQ0l4T1RnM0xURXlMVE14WENKY2JtUmhkR1ZmYkdGemRDQWdQQzBnWENJeU1ERTNMVEV5TFRNeFhDSmNibHh1STBkbGRDQjBhR1VnWkdGMFlWeHVWRklnUEMwZ2RIRmZaMlYwS0hScFkydGxjaXdnWm5KdmJUMWtZWFJsWDJacGNuTjBMQ0IwYnoxa1lYUmxYMnhoYzNRcFhHNWNibUJnWUNKOSAtLT5cblxuYGBgclxuXG5cbiMgRGVmaW5lIHF1ZXJ5IHBhcmFtZXRlcnNcbnRpY2tlciA8LSBcIlRSXCJcbmRhdGVfZmlyc3QgPC0gXCIxOTg3LTEyLTMxXCJcbmRhdGVfbGFzdCAgPC0gXCIyMDE3LTEyLTMxXCJcblxuI0dldCB0aGUgZGF0YVxuVFIgPC0gdHFfZ2V0KHRpY2tlciwgZnJvbT1kYXRlX2ZpcnN0LCB0bz1kYXRlX2xhc3QpXG5cbmBgYFxuXG48IS0tIHJuYi1zb3VyY2UtZW5kIC0tPlxuIn0= -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuXG5cbiMgRGVmaW5lIHF1ZXJ5IHBhcmFtZXRlcnNcbnRpY2tlciA8LSBcIlRSXCJcbmRhdGVfZmlyc3QgPC0gXCIxOTg3LTEyLTMxXCJcbmRhdGVfbGFzdCAgPC0gXCIyMDE3LTEyLTMxXCJcblxuI0dldCB0aGUgZGF0YVxuVFIgPC0gdHFfZ2V0KHRpY2tlciwgZnJvbT1kYXRlX2ZpcnN0LCB0bz1kYXRlX2xhc3QpXG5cbmBgYCJ9 -->

```r


# Define query parameters
ticker <- "TR"
date_first <- "1987-12-31"
date_last  <- "2017-12-31"

#Get the data
TR <- tq_get(ticker, from=date_first, to=date_last)

```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



Here is what the price looks like over time


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVjR3h2ZENoVVVpUmtZWFJsTEZSU0pHRmthblZ6ZEdWa0xIUjVjR1U5WENKc1hDSXNlR3hoWWoxY0lsUnBiV1ZjSWl4NWJHRmlQVndpVUhKcFkyVmNJaXh0WVdsdVBWd2lWRklnUVdScWRYTjBaV1FnVUhKcFkyVWdNVGs0T0MweU1ERTNYQ0lwTzJkeWFXUW9LVnh1WUdCZ0luMD0gLS0+XG5cbmBgYHJcbnBsb3QoVFIkZGF0ZSxUUiRhZGp1c3RlZCx0eXBlPVwibFwiLHhsYWI9XCJUaW1lXCIseWxhYj1cIlByaWNlXCIsbWFpbj1cIlRSIEFkanVzdGVkIFByaWNlIDE5ODgtMjAxN1wiKTtncmlkKClcbmBgYFxuXG48IS0tIHJuYi1zb3VyY2UtZW5kIC0tPlxuIn0= -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucGxvdChUUiRkYXRlLFRSJGFkanVzdGVkLHR5cGU9XCJsXCIseGxhYj1cIlRpbWVcIix5bGFiPVwiUHJpY2VcIixtYWluPVwiVFIgQWRqdXN0ZWQgUHJpY2UgMTk4OC0yMDE3XCIpO2dyaWQoKVxuYGBgIn0= -->

```r
plot(TR$date,TR$adjusted,type="l",xlab="Time",ylab="Price",main="TR Adjusted Price 1988-2017");grid()
```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



Now we extract the time series of prices and compute the series of 1-day returns, 
$$r_t = \log(P_t/P_{t-1}) = \log(P_t/P_0) - \log(P_{t-1}/P_0)$$ .


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVYRzRqSUVOdmJYQjFkR1VnZEdobElISmxkSFZ5Ym5NdUlDQlNaVzFsYldKbGNpQjBhR0YwSUhSb1pTQm1hWEp6ZENCeVpYUjFjbTRnYVhNZ2NtVmpiM0prWldRZ2IyNGdkR2hsSUhObFkyOXVaQ0IwY21Ga1pTQmtZWFJsTGlCVWFHRjBKM01nZDJoNUlIZGxJSEpsZEhKcFpYWmxJSEJ5YVdObGN5QmlaV1p2Y21VZ2RHaGxJR1pwY25OMElIUnlZV1JsSUdSaGRHVWdiMllnYVc1MFpYSmxjM1F1WEc1Y2JsQWdJQ0FnUEMwZ1ZGSWtZV1JxZFhOMFpXUmNibklnSUNBZ1BDMGdaR2xtWmloc2IyY29VQ2twWEc1T0lDQWdJRHd0SUd4bGJtZDBhQ2h5S1Z4dVhHNGpJRlJvWlNCeVpYUjFjbTV6SUdOaGJpQmhiSE52SUdKbElITjBiM0psWkNCaGN5QmhJRzVsZHlCamIyeDFiVzRnYVc0Z1ZGSXVJQ0JjYmx4dVZGSWtjaUE4TFNCaktFNUJMQ0JrYVdabUtHeHZaeWhVVWlSaFpHcDFjM1JsWkNrcEtWeHVYRzRqSUZSeWFXMGdiMlptSUhSb1pTQm1hWEp6ZENCeWIzY3NJSGRvYVdOb0lHaGhjeUJ5WlhSMWNtNGdUa0ZjYmxSU0lDQWdQQzBnVkZKYkxURXNYVnh1WEc1Y2JseHVjR3h2ZENoVVVpUmtZWFJsTEZSU0pISXNkSGx3WlQxY0lteGNJaXg0YkdGaVBWd2lWR2x0WlZ3aUxIbHNZV0k5WENKUWNtbGpaVndpTEcxaGFXNDlYQ0pVVWlCRVlXbHNlU0JTWlhSMWNtNXpJREU1T0RndE1qQXhOMXdpS1R0bmNtbGtLQ2xjYm1CZ1lDSjkgLS0+XG5cbmBgYHJcblxuIyBDb21wdXRlIHRoZSByZXR1cm5zLiAgUmVtZW1iZXIgdGhhdCB0aGUgZmlyc3QgcmV0dXJuIGlzIHJlY29yZGVkIG9uIHRoZSBzZWNvbmQgdHJhZGUgZGF0ZS4gVGhhdCdzIHdoeSB3ZSByZXRyaWV2ZSBwcmljZXMgYmVmb3JlIHRoZSBmaXJzdCB0cmFkZSBkYXRlIG9mIGludGVyZXN0LlxuXG5QICAgIDwtIFRSJGFkanVzdGVkXG5yICAgIDwtIGRpZmYobG9nKFApKVxuTiAgICA8LSBsZW5ndGgocilcblxuIyBUaGUgcmV0dXJucyBjYW4gYWxzbyBiZSBzdG9yZWQgYXMgYSBuZXcgY29sdW1uIGluIFRSLiAgXG5cblRSJHIgPC0gYyhOQSwgZGlmZihsb2coVFIkYWRqdXN0ZWQpKSlcblxuIyBUcmltIG9mZiB0aGUgZmlyc3Qgcm93LCB3aGljaCBoYXMgcmV0dXJuIE5BXG5UUiAgIDwtIFRSWy0xLF1cblxuXG5cbnBsb3QoVFIkZGF0ZSxUUiRyLHR5cGU9XCJsXCIseGxhYj1cIlRpbWVcIix5bGFiPVwiUHJpY2VcIixtYWluPVwiVFIgRGFpbHkgUmV0dXJucyAxOTg4LTIwMTdcIik7Z3JpZCgpXG5gYGBcblxuPCEtLSBybmItc291cmNlLWVuZCAtLT5cbiJ9 -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuXG4jIENvbXB1dGUgdGhlIHJldHVybnMuICBSZW1lbWJlciB0aGF0IHRoZSBmaXJzdCByZXR1cm4gaXMgcmVjb3JkZWQgb24gdGhlIHNlY29uZCB0cmFkZSBkYXRlLiBUaGF0J3Mgd2h5IHdlIHJldHJpZXZlIHByaWNlcyBiZWZvcmUgdGhlIGZpcnN0IHRyYWRlIGRhdGUgb2YgaW50ZXJlc3QuXG5cblAgICAgPC0gVFIkYWRqdXN0ZWRcbnIgICAgPC0gZGlmZihsb2coUCkpXG5OICAgIDwtIGxlbmd0aChyKVxuXG4jIFRoZSByZXR1cm5zIGNhbiBhbHNvIGJlIHN0b3JlZCBhcyBhIG5ldyBjb2x1bW4gaW4gVFIuICBcblxuVFIkciA8LSBjKE5BLCBkaWZmKGxvZyhUUiRhZGp1c3RlZCkpKVxuXG4jIFRyaW0gb2ZmIHRoZSBmaXJzdCByb3csIHdoaWNoIGhhcyByZXR1cm4gTkFcblRSICAgPC0gVFJbLTEsXVxuXG5cblxucGxvdChUUiRkYXRlLFRSJHIsdHlwZT1cImxcIix4bGFiPVwiVGltZVwiLHlsYWI9XCJQcmljZVwiLG1haW49XCJUUiBEYWlseSBSZXR1cm5zIDE5ODgtMjAxN1wiKTtncmlkKClcbmBgYCJ9 -->

```r

# Compute the returns.  Remember that the first return is recorded on the second trade date. That's why we retrieve prices before the first trade date of interest.

P    <- TR$adjusted
r    <- diff(log(P))
N    <- length(r)

# The returns can also be stored as a new column in TR.  

TR$r <- c(NA, diff(log(TR$adjusted)))

# Trim off the first row, which has return NA
TR   <- TR[-1,]



plot(TR$date,TR$r,type="l",xlab="Time",ylab="Price",main="TR Daily Returns 1988-2017");grid()
```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


The daily return series is noisy, and the mean value is barely visible.  However the scale of the noise fluctuations is not constant over time.  This is the phenomenon of time-varying volatility.  Compare the graph above with the simulation below, in which simulated returns have the same average volatility and zero mean.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVjR3h2ZENoVVVpUmtZWFJsTEhKdWIzSnRLRzV5YjNjb1ZGSXBLU3B6WkNoVVVpUnlLU3gwZVhCbFBWd2liRndpTEhsc2FXMDlZeWd0TUM0eE9Dd3dMakU0S1N4NGJHRmlQVndpVkdsdFpWd2lMSGxzWVdJOVhDSlFjbWxqWlZ3aUxHMWhhVzQ5WENKWGFHbDBaU0JPYjJselpTQlFjbTlqWlhOeklIZHBkR2dnVkZJZ1ZtOXNZWFJwYkdsMGVWd2lLVHRuY21sa0tDbGNibUJnWUNKOSAtLT5cblxuYGBgclxucGxvdChUUiRkYXRlLHJub3JtKG5yb3coVFIpKSpzZChUUiRyKSx0eXBlPVwibFwiLHlsaW09YygtMC4xOCwwLjE4KSx4bGFiPVwiVGltZVwiLHlsYWI9XCJQcmljZVwiLG1haW49XCJXaGl0ZSBOb2lzZSBQcm9jZXNzIHdpdGggVFIgVm9sYXRpbGl0eVwiKTtncmlkKClcbmBgYFxuXG48IS0tIHJuYi1zb3VyY2UtZW5kIC0tPlxuIn0= -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucGxvdChUUiRkYXRlLHJub3JtKG5yb3coVFIpKSpzZChUUiRyKSx0eXBlPVwibFwiLHlsaW09YygtMC4xOCwwLjE4KSx4bGFiPVwiVGltZVwiLHlsYWI9XCJQcmljZVwiLG1haW49XCJXaGl0ZSBOb2lzZSBQcm9jZXNzIHdpdGggVFIgVm9sYXRpbGl0eVwiKTtncmlkKClcbmBgYCJ9 -->

```r
plot(TR$date,rnorm(nrow(TR))*sd(TR$r),type="l",ylim=c(-0.18,0.18),xlab="Time",ylab="Price",main="White Noise Process with TR Volatility");grid()
```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Summary statistics and return distribution

These are high-level summary stats that R provides for any data frame.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVjM1Z0YldGeWVTaFVVaWxjYm1CZ1lDSjkgLS0+XG5cbmBgYHJcbnN1bW1hcnkoVFIpXG5gYGBcblxuPCEtLSBybmItc291cmNlLWVuZCAtLT5cbiJ9 -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc3VtbWFyeShUUilcbmBgYCJ9 -->

```r
summary(TR)
```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



# Annualization conventions

We typically report return and risk measures in annualized terms.  By convention, we assume a typical year has 252 trading days and use the following rules:

- Annualized return = 252 * (Daily return)
- Annualized std. dev. = sqrt(252) * (Daily std. dev)

For monthly returns, replace the 252 by 12.



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVJRnh1YldWaGJpaHlLU295TlRJZ0lDQWdJQ01nVFdWaGJpQnlaWFIxY200Z1ptOXlJRlJTSUNoaGJtNTFZV3hwZW1VZ1lua2dNalV5SUdSaGVYTXZlV1ZoY2lsY2JuTmtLSElwS25OeGNuUW9NalV5S1NBaklGWnZiR0YwYVd4cGRIa2diMllnVkZJZ0tHRnViblZoYkdsNlpTQjNhWFJvSUhOeGRXRnlaU0J5YjI5MElTbGNibHh1YzNWdGJXRnllU2h5S1Z4dVlHQmdJbjA9IC0tPlxuXG5gYGByXG4gXG5tZWFuKHIpKjI1MiAgICAgIyBNZWFuIHJldHVybiBmb3IgVFIgKGFubnVhbGl6ZSBieSAyNTIgZGF5cy95ZWFyKVxuc2Qocikqc3FydCgyNTIpICMgVm9sYXRpbGl0eSBvZiBUUiAoYW5udWFsaXplIHdpdGggc3F1YXJlIHJvb3QhKVxuXG5zdW1tYXJ5KHIpXG5gYGBcblxuPCEtLSBybmItc291cmNlLWVuZCAtLT5cbiJ9 -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIFxubWVhbihyKSoyNTIgICAgICMgTWVhbiByZXR1cm4gZm9yIFRSIChhbm51YWxpemUgYnkgMjUyIGRheXMveWVhcilcbnNkKHIpKnNxcnQoMjUyKSAjIFZvbGF0aWxpdHkgb2YgVFIgKGFubnVhbGl6ZSB3aXRoIHNxdWFyZSByb290ISlcblxuc3VtbWFyeShyKVxuYGBgIn0= -->

```r
 
mean(r)*252     # Mean return for TR (annualize by 252 days/year)
sd(r)*sqrt(252) # Volatility of TR (annualize with square root!)

summary(r)
```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


The histogram of returns has fat tails (and therefore a thin middle).  Because it is the unconditional distribution of returns, independent of their time ordering, it tells nothing about the causal structure of return correlations.



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVhR2x6ZENoeUxDQmljbVZoYTNNOU5UQXBYRzVnWUdBaWZRPT0gLS0+XG5cbmBgYHJcbmhpc3QociwgYnJlYWtzPTUwKVxuYGBgXG5cbjwhLS0gcm5iLXNvdXJjZS1lbmQgLS0+XG4ifQ== -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaGlzdChyLCBicmVha3M9NTApXG5gYGAifQ== -->

```r
hist(r, breaks=50)
```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


# Lo & MacKinlay

Following Lo & MacKinlay, we ask whether the measured sample variance of returns grows linearly as function of the observation interval.



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVWbUZ5YVdGdVkyVWdQQzBnZG1GeUtHUnBabVlvYkc5bktGQXBLU2tnWEc1Y2JtWnZjaUFvYmlCcGJpQXlPakV3TUNrZ2UxeHVJQ0JXWVhKcFlXNWpaVnR1WFNBOExTQjJZWElvWkdsbVppaHNiMmNvVUZ0elpYRW9abkp2YlQxdUxDQjBiejFzWlc1bmRHZ29VQ2tzSUdKNVBXNHBYU2twS1Z4dWZWeHVYRzV3Ykc5MEtGWmhjbWxoYm1ObExIaHNZV0k5WENKdVhDSXNiV0ZwYmoxY0lsWmhjbWxoYm1ObElHOW1JRkpsZEhWeWJuTWdSbkp2YlNCdUxXUmhlU0JQWW5ObGNuWmhkR2x2Ym5OY0lpazdaM0pwWkNncFhHNWNibUJnWUNKOSAtLT5cblxuYGBgclxuVmFyaWFuY2UgPC0gdmFyKGRpZmYobG9nKFApKSkgXG5cbmZvciAobiBpbiAyOjEwMCkge1xuICBWYXJpYW5jZVtuXSA8LSB2YXIoZGlmZihsb2coUFtzZXEoZnJvbT1uLCB0bz1sZW5ndGgoUCksIGJ5PW4pXSkpKVxufVxuXG5wbG90KFZhcmlhbmNlLHhsYWI9XCJuXCIsbWFpbj1cIlZhcmlhbmNlIG9mIFJldHVybnMgRnJvbSBuLWRheSBPYnNlcnZhdGlvbnNcIik7Z3JpZCgpXG5cbmBgYFxuXG48IS0tIHJuYi1zb3VyY2UtZW5kIC0tPlxuIn0= -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuVmFyaWFuY2UgPC0gdmFyKGRpZmYobG9nKFApKSkgXG5cbmZvciAobiBpbiAyOjEwMCkge1xuICBWYXJpYW5jZVtuXSA8LSB2YXIoZGlmZihsb2coUFtzZXEoZnJvbT1uLCB0bz1sZW5ndGgoUCksIGJ5PW4pXSkpKVxufVxuXG5wbG90KFZhcmlhbmNlLHhsYWI9XCJuXCIsbWFpbj1cIlZhcmlhbmNlIG9mIFJldHVybnMgRnJvbSBuLWRheSBPYnNlcnZhdGlvbnNcIik7Z3JpZCgpXG5cbmBgYCJ9 -->

```r
Variance <- var(diff(log(P))) 

for (n in 2:100) {
  Variance[n] <- var(diff(log(P[seq(from=n, to=length(P), by=n)])))
}

plot(Variance,xlab="n",main="Variance of Returns From n-day Observations");grid()

```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


Looks linear, doesn't it?  Is that good enough?  What about the slope?  What about the raggedness on the right side of the graph?  Is that simply noise due to have a smaller number of samples when the window size gets large?  Or could there be a systematic deviation of the linear rule hiding in the graph?

# Variance and Ratios

Here we define functions for $\widehat \sigma^2_c$, which is a function of a series of observations $X_t$ and an aggregation length $q$.

The $z$-statistics and $p$-values follow from the distribution of the estimator as a random variable


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVkbUZ5YVdGdVkyVXVZeUE4TFNCbWRXNWpkR2x2YmloWUxDQnhLU0I3WEc0aklFTnZiWEIxZEdVZ2RtRnlhV0Z1WTJVZ2MzUmhkR2x6ZEdsaklHWnliMjBnYjNabGNteGhjSEJwYm1jZ2NTMXdaWEpwYjJRZ2QybHVaRzkzYzF4dUl5QlRaV1VnVEc4Z0ppQk5ZV05MYVc1c1lYa2dLREU1T0RncExDQndMaUEwTnl3Z1JYRXVJREV5SUZ4dUlDQmNiaUFnVkNBZ0lDQWdQQzBnYkdWdVozUm9LRmdwSUMwZ01TQWdYRzRnSUcxMUlDQWdJRHd0SUNoWVcxUXJNVjBnTFNCWVd6RmRLUzlVSUNCY2JpQWdiU0FnSUNBZ1BDMGdLRlF0Y1NrcUtGUXRjU3N4S1NweEwxUmNiaUFnYzNWdGMzRWdQQzBnTUNBZ1hHNGdJR1p2Y2lBb2RDQnBiaUJ4T2xRcElIc2dYRzRnSUNBZ2MzVnRjM0VnUEMwZ2MzVnRjM0VnS3lBb1dGdDBLekZkSUMwZ1dGdDBMWEVyTVYwZ0xTQnhLbTExS1Y0eUlGeHVJQ0I5SUNCY2JpQWdjbVYwZFhKdUtITjFiWE54TDIwcFhHNTlYRzVjYm5vZ1BDMGdablZ1WTNScGIyNG9XQ3dnY1NrZ2UxeHVJeUJEYjIxd2RYUmxJSE5oYlhCc2FXNW5JSE4wWVhScGMzUnBZeUJtYjNJZ2RtRnlhV0Z1WTJVZ2NtRjBhVzljYmlNZ1UyVmxJRXh2SUNZZ1RXRmpTMmx1YkdGNUlDZ3hPVGc0S1N3Z2NDNGdORGNzSUd4aGMzUWdiR2x1WlNBb1lXWjBaWElnUlhGekxpQXhNaTB4TkNrZ0lGeHVJQ0JVSUR3dElHeGxibWQwYUNoWUtTQXRJREVnSUZ4dUlDQmpJRHd0SUhOeGNuUW9WQ29vTXlweEtTOG9NaW9vTWlweExURXBLaWh4TFRFcEtTa2dJRnh1SUNCTklEd3RJSFpoY21saGJtTmxMbU1vV0N4eEtTOTJZWEpwWVc1alpTNWpLRmdzTVNrZ0xTQXhJQ0JjYmlBZ2VpQThMU0JqS2sxY2JpQWdjbVYwZFhKdUtIb3BYRzU5WEc1Y2JsWmpJQ0FnSUNBZ1BDMGdNRHNnWm05eUlDaHhJR2x1SURFNk1UQXdLU0I3Vm1OYmNWMGdQQzBnZG1GeWFXRnVZMlV1WXloc2IyY29VQ2tzY1NsOVhHNTZjM1JoZEhNZ0lEd3RJREE3SUdadmNpQW9jU0JwYmlBeU9qRXdNQ2tnZTNwemRHRjBjMXR4WFNBOExTQjZLR3h2WnloUUtTeHhLU0I5WEc1d1ZtRnNkV1Z6SUR3dElESXFjRzV2Y20wb0xXRmljeWg2YzNSaGRITXBLVnh1WW1GeWNHeHZkQ2g2YzNSaGRITXNJSGxzWVdJOVhDSjZYQ0lzZUd4aFlqMWNJbkZjSWl4dFlXbHVQVndpZWlCVGRHRjBhWE4wYVdOeklHOW1JRlpoY21saGJtTmxJRkpoZEdsdklGUmxjM1JjSWlsY2JseHVZR0JnSW4wPSAtLT5cblxuYGBgclxudmFyaWFuY2UuYyA8LSBmdW5jdGlvbihYLCBxKSB7XG4jIENvbXB1dGUgdmFyaWFuY2Ugc3RhdGlzdGljIGZyb20gb3ZlcmxhcHBpbmcgcS1wZXJpb2Qgd2luZG93c1xuIyBTZWUgTG8gJiBNYWNLaW5sYXkgKDE5ODgpLCBwLiA0NywgRXEuIDEyIFxuICBcbiAgVCAgICAgPC0gbGVuZ3RoKFgpIC0gMSAgXG4gIG11ICAgIDwtIChYW1QrMV0gLSBYWzFdKS9UICBcbiAgbSAgICAgPC0gKFQtcSkqKFQtcSsxKSpxL1RcbiAgc3Vtc3EgPC0gMCAgXG4gIGZvciAodCBpbiBxOlQpIHsgXG4gICAgc3Vtc3EgPC0gc3Vtc3EgKyAoWFt0KzFdIC0gWFt0LXErMV0gLSBxKm11KV4yIFxuICB9ICBcbiAgcmV0dXJuKHN1bXNxL20pXG59XG5cbnogPC0gZnVuY3Rpb24oWCwgcSkge1xuIyBDb21wdXRlIHNhbXBsaW5nIHN0YXRpc3RpYyBmb3IgdmFyaWFuY2UgcmF0aW9cbiMgU2VlIExvICYgTWFjS2lubGF5ICgxOTg4KSwgcC4gNDcsIGxhc3QgbGluZSAoYWZ0ZXIgRXFzLiAxMi0xNCkgIFxuICBUIDwtIGxlbmd0aChYKSAtIDEgIFxuICBjIDwtIHNxcnQoVCooMypxKS8oMiooMipxLTEpKihxLTEpKSkgIFxuICBNIDwtIHZhcmlhbmNlLmMoWCxxKS92YXJpYW5jZS5jKFgsMSkgLSAxICBcbiAgeiA8LSBjKk1cbiAgcmV0dXJuKHopXG59XG5cblZjICAgICAgPC0gMDsgZm9yIChxIGluIDE6MTAwKSB7VmNbcV0gPC0gdmFyaWFuY2UuYyhsb2coUCkscSl9XG56c3RhdHMgIDwtIDA7IGZvciAocSBpbiAyOjEwMCkge3pzdGF0c1txXSA8LSB6KGxvZyhQKSxxKSB9XG5wVmFsdWVzIDwtIDIqcG5vcm0oLWFicyh6c3RhdHMpKVxuYmFycGxvdCh6c3RhdHMsIHlsYWI9XCJ6XCIseGxhYj1cInFcIixtYWluPVwieiBTdGF0aXN0aWNzIG9mIFZhcmlhbmNlIFJhdGlvIFRlc3RcIilcblxuYGBgXG5cbjwhLS0gcm5iLXNvdXJjZS1lbmQgLS0+XG4ifQ== -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxudmFyaWFuY2UuYyA8LSBmdW5jdGlvbihYLCBxKSB7XG4jIENvbXB1dGUgdmFyaWFuY2Ugc3RhdGlzdGljIGZyb20gb3ZlcmxhcHBpbmcgcS1wZXJpb2Qgd2luZG93c1xuIyBTZWUgTG8gJiBNYWNLaW5sYXkgKDE5ODgpLCBwLiA0NywgRXEuIDEyIFxuICBcbiAgVCAgICAgPC0gbGVuZ3RoKFgpIC0gMSAgXG4gIG11ICAgIDwtIChYW1QrMV0gLSBYWzFdKS9UICBcbiAgbSAgICAgPC0gKFQtcSkqKFQtcSsxKSpxL1RcbiAgc3Vtc3EgPC0gMCAgXG4gIGZvciAodCBpbiBxOlQpIHsgXG4gICAgc3Vtc3EgPC0gc3Vtc3EgKyAoWFt0KzFdIC0gWFt0LXErMV0gLSBxKm11KV4yIFxuICB9ICBcbiAgcmV0dXJuKHN1bXNxL20pXG59XG5cbnogPC0gZnVuY3Rpb24oWCwgcSkge1xuIyBDb21wdXRlIHNhbXBsaW5nIHN0YXRpc3RpYyBmb3IgdmFyaWFuY2UgcmF0aW9cbiMgU2VlIExvICYgTWFjS2lubGF5ICgxOTg4KSwgcC4gNDcsIGxhc3QgbGluZSAoYWZ0ZXIgRXFzLiAxMi0xNCkgIFxuICBUIDwtIGxlbmd0aChYKSAtIDEgIFxuICBjIDwtIHNxcnQoVCooMypxKS8oMiooMipxLTEpKihxLTEpKSkgIFxuICBNIDwtIHZhcmlhbmNlLmMoWCxxKS92YXJpYW5jZS5jKFgsMSkgLSAxICBcbiAgeiA8LSBjKk1cbiAgcmV0dXJuKHopXG59XG5cblZjICAgICAgPC0gMDsgZm9yIChxIGluIDE6MTAwKSB7VmNbcV0gPC0gdmFyaWFuY2UuYyhsb2coUCkscSl9XG56c3RhdHMgIDwtIDA7IGZvciAocSBpbiAyOjEwMCkge3pzdGF0c1txXSA8LSB6KGxvZyhQKSxxKSB9XG5wVmFsdWVzIDwtIDIqcG5vcm0oLWFicyh6c3RhdHMpKVxuYmFycGxvdCh6c3RhdHMsIHlsYWI9XCJ6XCIseGxhYj1cInFcIixtYWluPVwieiBTdGF0aXN0aWNzIG9mIFZhcmlhbmNlIFJhdGlvIFRlc3RcIilcblxuYGBgIn0= -->

```r
variance.c <- function(X, q) {
# Compute variance statistic from overlapping q-period windows
# See Lo & MacKinlay (1988), p. 47, Eq. 12 
  
  T     <- length(X) - 1  
  mu    <- (X[T+1] - X[1])/T  
  m     <- (T-q)*(T-q+1)*q/T
  sumsq <- 0  
  for (t in q:T) { 
    sumsq <- sumsq + (X[t+1] - X[t-q+1] - q*mu)^2 
  }  
  return(sumsq/m)
}

z <- function(X, q) {
# Compute sampling statistic for variance ratio
# See Lo & MacKinlay (1988), p. 47, last line (after Eqs. 12-14)  
  T <- length(X) - 1  
  c <- sqrt(T*(3*q)/(2*(2*q-1)*(q-1)))  
  M <- variance.c(X,q)/variance.c(X,1) - 1  
  z <- c*M
  return(z)
}

Vc      <- 0; for (q in 1:100) {Vc[q] <- variance.c(log(P),q)}
zstats  <- 0; for (q in 2:100) {zstats[q] <- z(log(P),q) }
pValues <- 2*pnorm(-abs(zstats))
barplot(zstats, ylab="z",xlab="q",main="z Statistics of Variance Ratio Test")

```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Interpreting the test statistics

The test statistic $z(q)$ was constructed to be normally distributed as ${\cal N}(0,1)$ if the data followed a random walk and scaled accordingly.  From the graph, we see that all of these $z$-statistics are greater than two in magnitude -- and they all have the same sign.  They are not consistent with the first random walk hypothesis, and their systematic deviation suggests that the model needs to be extended rather than discarded by including serial correlation.




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVjMmxuYldFZ1BDMGdjM0Z5ZENneU5USXBLbk5rS0dScFptWW9iRzluS0ZBcEtTa2dYRzVnWUdBaWZRPT0gLS0+XG5cbmBgYHJcbnNpZ21hIDwtIHNxcnQoMjUyKSpzZChkaWZmKGxvZyhQKSkpIFxuYGBgXG5cbjwhLS0gcm5iLXNvdXJjZS1lbmQgLS0+XG4ifQ== -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc2lnbWEgPC0gc3FydCgyNTIpKnNkKGRpZmYobG9nKFApKSkgXG5gYGAifQ== -->

```r
sigma <- sqrt(252)*sd(diff(log(P))) 
```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoiRXJyb3I6IG9iamVjdCAnUCcgbm90IGZvdW5kXG4ifQ== -->

```
Error: object 'P' not found
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-output-begin eyJkYXRhIjoiXG48IS0tIHJuYi1zb3VyY2UtYmVnaW4gZXlKa1lYUmhJam9pWUdCZ2NseHVVQzVOUXlBOExTQmxlSEFvWTNWdGMzVnRLSEp1YjNKdEtFNHBLakF1TURJcEtTQWpJRTF2Ym5SbElFTmhjbXh2SUhKbGRIVnlibk1nTXpJbElIWnZiRnh1YzJsbmJXRXVUVU1nUEMwZ2MzRnlkQ2d5TlRJcEtuTmtLR1JwWm1Zb2JHOW5LRkF1VFVNcEtTa2dYRzVjYm1admNpQW9iaUJwYmlBeU9qRXdNQ2tnZTF4dUlDQnphV2R0WVM1TlExdHVYU0E4TFNCemNYSjBLREkxTWk5dUtTcHpaQ2hrYVdabUtHeHZaeWhRTGsxRFczTmxjU2htY205dFBXNHNJSFJ2UFU0c0lHSjVQVzRwWFNrcEtWeHVmVnh1WEc1aVlYSndiRzkwS0hOcFoyMWhMazFETEhoc1lXSTlYQ0p1WENJc2VXeGhZajFjSWxOMFlXNWtZWEprSUVSbGRtbGhkR2x2YmlBb1lXNXVkV0ZzYVhwbFpDa2dMeUJ6Y1hKMEtHNHBYQ0lzYldGcGJqMWNJbFp2YkdGMGFXeHBkSGtnVTJOaGJHbHVaeUJ2WmlCU1pYUjFjbTV6SUVaeWIyMGdiaTFrWVhrZ1QySnpaWEoyWVhScGIyNXpJQ2hUYVcwcFhDSXBPMmR5YVdRb0tWeHVYRzVnWUdBaWZRPT0gLS0+XG5cbmBgYHJcblAuTUMgPC0gZXhwKGN1bXN1bShybm9ybShOKSowLjAyKSkgIyBNb250ZSBDYXJsbyByZXR1cm5zIDMyJSB2b2xcbnNpZ21hLk1DIDwtIHNxcnQoMjUyKSpzZChkaWZmKGxvZyhQLk1DKSkpIFxuXG5mb3IgKG4gaW4gMjoxMDApIHtcbiAgc2lnbWEuTUNbbl0gPC0gc3FydCgyNTIvbikqc2QoZGlmZihsb2coUC5NQ1tzZXEoZnJvbT1uLCB0bz1OLCBieT1uKV0pKSlcbn1cblxuYmFycGxvdChzaWdtYS5NQyx4bGFiPVwiblwiLHlsYWI9XCJTdGFuZGFyZCBEZXZpYXRpb24gKGFubnVhbGl6ZWQpIC8gc3FydChuKVwiLG1haW49XCJWb2xhdGlsaXR5IFNjYWxpbmcgb2YgUmV0dXJucyBGcm9tIG4tZGF5IE9ic2VydmF0aW9ucyAoU2ltKVwiKTtncmlkKClcblxuYGBgXG5cbjwhLS0gcm5iLXNvdXJjZS1lbmQgLS0+XG4ifQ== -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuUC5NQyA8LSBleHAoY3Vtc3VtKHJub3JtKE4pKjAuMDIpKSAjIE1vbnRlIENhcmxvIHJldHVybnMgMzIlIHZvbFxuc2lnbWEuTUMgPC0gc3FydCgyNTIpKnNkKGRpZmYobG9nKFAuTUMpKSkgXG5cbmZvciAobiBpbiAyOjEwMCkge1xuICBzaWdtYS5NQ1tuXSA8LSBzcXJ0KDI1Mi9uKSpzZChkaWZmKGxvZyhQLk1DW3NlcShmcm9tPW4sIHRvPU4sIGJ5PW4pXSkpKVxufVxuXG5iYXJwbG90KHNpZ21hLk1DLHhsYWI9XCJuXCIseWxhYj1cIlN0YW5kYXJkIERldmlhdGlvbiAoYW5udWFsaXplZCkgLyBzcXJ0KG4pXCIsbWFpbj1cIlZvbGF0aWxpdHkgU2NhbGluZyBvZiBSZXR1cm5zIEZyb20gbi1kYXkgT2JzZXJ2YXRpb25zIChTaW0pXCIpO2dyaWQoKVxuXG5gYGAifQ== -->

```r
P.MC <- exp(cumsum(rnorm(N)*0.02)) # Monte Carlo returns 32% vol
sigma.MC <- sqrt(252)*sd(diff(log(P.MC))) 

for (n in 2:100) {
  sigma.MC[n] <- sqrt(252/n)*sd(diff(log(P.MC[seq(from=n, to=N, by=n)])))
}

barplot(sigma.MC,xlab="n",ylab="Standard Deviation (annualized) / sqrt(n)",main="Volatility Scaling of Returns From n-day Observations (Sim)");grid()

```

<!-- rnb-source-end -->


<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->

