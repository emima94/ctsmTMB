% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{plot.ctsmTMB.pred}
\alias{plot.ctsmTMB.pred}
\title{Plot of k-step predictions from a ctsmTMB prediction object}
\usage{
\method{plot}{ctsmTMB.pred}(
  x,
  y,
  k.ahead = unique(x[["states"]][["k.ahead"]]),
  state.name = NULL,
  type = "states",
  against = NULL,
  ...
)
}
\arguments{
\item{x}{a ctsmTMB.pred object}

\item{y}{not used}

\item{k.ahead}{an integer indicating which k-ahead predictions to plot}

\item{state.name}{a string indicating which states to plot}

\item{type}{one of 'states' or 'observations', to plot}

\item{against}{name of an observations to plot predictions against}

\item{...}{additional arguments}
}
\value{
A plot of predicted states
}
\description{
Plot of k-step predictions from a ctsmTMB prediction object
}
\examples{
library(ctsmTMB)
model <- ctsmTMB$new()

# create model
model$addSystem(dx ~ theta * (mu+u-x) * dt + sigma_x*dw)
model$addObs(y ~ x)
model$setVariance(y ~ sigma_y^2)
model$addInput(u)
model$setParameter(
  theta   = c(initial = 1, lower=1e-5, upper=50),
  mu      = c(initial=1.5, lower=0, upper=5),
  sigma_x = c(initial=1, lower=1e-10, upper=30),
  sigma_y = 1e-2
)
model$setInitialState(list(1,1e-1))

# fit model to data
fit <- model$estimate(Ornstein)

# perform moment predictions
pred <- model$predict(Ornstein)

# plot the k.ahead=10 predictions
plot(pred, against="y.data")


# plot filtered states
plot(fit, type="states", against="y")
}
