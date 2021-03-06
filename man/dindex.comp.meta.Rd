\name{dindex.comp.meta}
\alias{dindex.comp.meta}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Function to compare two D indices}
\description{
This function compares two lists of D indices computed from the same survival data by using the function \code{D.index}. The statistical test is a Student t test for dependent samples.
}
\usage{
dindex.comp.meta(list.dindex1, list.dindex2, hetero = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{list.dindex1}{first list of D indices as returned by the \code{D.index} function.}
  \item{list.dindex2}{second list of D indices as returned by the \code{D.index} function.}
  \item{hetero}{if TRUE, a random effect model is use to compute the meta-estimators. Otherwise a fixed effect model is used.}
}
\details{
  In meta-analysis, we estimate the statistic of interest in several independent datasets. It results a list of estimates such as list of D indices. The two lists of D indices must be computed from the same samples (and corresponding survival data). The function computes a meta-estimator for the correlations between the two scores and uses a Student t test for dependent samples.
}
\value{
  \item{p.value }{p-value from the Student t test for the comparison dindex1 > dindex2.}
  \item{dindex1 }{meta-estimator of the first D index.}
  \item{dindex2 }{meta-estimator of the second D index.}
}
\references{Cochrane, W. G. (1954) "The combination of estimates from different experiments", \emph{Biometrics}, \bold{10}, pages 101--129.

Haibe-Kains, B. and Desmedt, C. and Sotiriou, C. and Bontempi, G. (2008) "A comparative study of survival models for breast cancer prognostication based on microarray  data: does a single gene beat them all?", \emph{Bioinformatics}, \bold{24}, 19, pages 2200--2208.}
\author{ Benjamin Haibe-Kains}
%\note{ ~~further notes~~ }
\seealso{\code{\link{concordance.index}}.}
\examples{
#first dataset
set.seed(12345)
age <- rnorm(100, 50, 10)
size <- rexp(100,1)
stime <- rexp(100)
cens <- runif(100,.5,2)
sevent <- as.numeric(stime <= cens)
stime <- pmin(stime, cens)
d1.1 <- D.index(x=age, surv.time=stime, surv.event=sevent)
d2.1 <- D.index(x=size, surv.time=stime, surv.event=sevent)
#second dataset
set.seed(54321)
age <- rnorm(110, 53, 10)
size <- rexp(110,1.1)
stime <- rexp(110)
cens <- runif(110,.55,2)
sevent <- as.numeric(stime <= cens)
stime <- pmin(stime, cens)
d1.2 <- D.index(x=age, surv.time=stime, surv.event=sevent)
d2.2 <- D.index(x=size, surv.time=stime, surv.event=sevent)
dindex.comp.meta(list.dindex1=list("dindex.age1"=d1.1, "dindex.age2"=d1.2),
  list.dindex2=list("dindex.size1"=d2.1, "dindex.size2"=d2.2))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survival}
\keyword{htest}% __ONLY ONE__ keyword per line
