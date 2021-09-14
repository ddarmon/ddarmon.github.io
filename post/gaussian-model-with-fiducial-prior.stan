data {
  int N; // sample size
  vector[N] x; // data
}

parameters {
  real mu;
  real<lower=0> sigma2;
}

model {
  // No prior needed for mu since log(1) = 0
  target += -log(sigma2); // log(1 / sigma^2) = - log(sigma^2)
  
  x ~ normal(mu, sqrt(sigma2));
}
