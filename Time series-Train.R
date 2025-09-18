train <- read_excel("C:/Users/victo/OneDrive/Data Analyst/train.xlsx")
View(train)
library(tidyverse)   
library(forecast)
library(zoo)
#############################################
# Aggregate to monthly sales
sales_monthly <- train %>%
  mutate(month = lubridate::floor_date(`Order Date`, "month")) %>%
  group_by(month) %>%
  summarise(Sales = sum(Sales, na.rm = TRUE), .groups = "drop")

###############################################
# Quick plot
sales_ts <- ts(
  sales_monthly$Sales,
  start = c(lubridate::year(min(sales_monthly$month)),
            lubridate::month(min(sales_monthly$month))),
  frequency = 12
)
plot(sales_ts, main = "Monthly Sales", ylab = "Sales", xlab = "Time")

##################################################
# Forecast
fit_arima <- forecast::auto.arima(sales_ts)
fc_arima  <- forecast::forecast(fit_arima, h = 12)
autoplot(fc_arima) + ggtitle("ARIMA Forecast - Monthly Sales")

###########################################################
# ACF plot
acf(sales_ts, main = "ACF - Monthly Sales")

#################################################
#PACF plot
pacf(sales_ts, main = "PACF - Monthly Sales")


##############################################################################
#Running a test for the best arima model
auto_model <- auto.arima(sales_ts, seasonal = TRUE, stepwise = FALSE, approximation = FALSE)
summary(auto_model)
checkresiduals(auto_model)

########################################
#Running test for best ETS model
fit_ets   <- ets(sales_ts)
checkresiduals(fit_ets)  # residual ACF + Ljung–Box test
accuracy(fit_ets)  

########################################
#Plotting ETS model
autoplot(sales_ts, series = "Fitted") +
  autolayer(fitted(fit_ets), series = "Fitted", color = "black") +
  ggtitle("ETS: Actual vs Fitted (Monthly Sales)") +
  ylab("Sales") + xlab("Time") +
  guides(colour = guide_legend(title = "Series"))

##########################################
#Forecast
h <- 12
fc_ets <- forecast(fit_ets, h = h)

# Plot forecast with intervals
|

##############################
# Forecast 12 months ahead
h <- 12
fc_ets <- forecast(fit_ets, h = h)

# Create a tidy dataframe with point forecast + intervals
ets_out <- data.frame(
  date = as.Date(time(fc_ets$mean)),       # forecasted months
  point_forecast = as.numeric(fc_ets$mean),
  lo80 = as.numeric(fc_ets$lower[,"80%"]),
  hi80 = as.numeric(fc_ets$upper[,"80%"]),
  lo95 = as.numeric(fc_ets$lower[,"95%"]),
  hi95 = as.numeric(fc_ets$upper[,"95%"])
)

# View in console
print(ets_out)
