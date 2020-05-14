# Forecast-Daily-Interstate-94-Westbound-Traffic-Volume-for-MN-DoT-ATR-Station-301

The purpose of this project is to forecast daily traffic volume and to assess the effect of days of the week, Holidays, and different weather conditions on traffic.Study results can be used to generate strategies, such as increasing tolls on specific weekdays, to alleviate traffic jams and help reduce car emissions. 

We used SAS to develop univariate deterministic time series models (Seasonal Dummies, Seasonal Dummies with error model, Cyclical trend model, Cyclical trend model with error model), univariate stochastic time series models (seasonal ARIMA), and multivariate models (transfer function models).
Predictors in TF models are Average temperature, Amount of rain, and Average percentage of cloud cover. The best performing model achieves a test MAPE of 14.74.

Some interesting findings: 1) Traffic volume is affected by the Average percentage of cloud cover; 2) Friday is the busiest day of the week; 3) Holidays are less busy than non-holidays.

Models: Seasonal Dummies, Cyclical trend model, Error model, seasonal ARIMA, TF model







