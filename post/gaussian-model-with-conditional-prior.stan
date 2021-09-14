// See digital page 82 of *A First Course in Bayesian Statistical Methods*.

data {
  int N;
  vector[N] x;
  real mu0; // mean for prior on mu
  real kappa0; // sample size for prior on mu
  real sigma0; // prior value for sigma
  real nu0; // sample size for prior on sigma^2
}

parameters {
  real mu;
  real<lower=0> prec;
}

transformed parameters{
  real<lower=0> sigma;
  
  sigma = 1/sqrt(prec);
}

model {
  prec ~ gamma(nu0/2, nu0/2*square(sigma0));
  mu ~ normal(mu0, sigma/sqrt(kappa0));
  
  x ~ normal(mu, sigma);
}
