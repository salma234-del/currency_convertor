abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeAutoValidateMode extends HomeState {}

class HomeChangeFromCurrency extends HomeState {}

class HomeChangeToCurrency extends HomeState {}

class HomeGetCurrenciesLoading extends HomeState {}

class HomeGetCurrenciesSuccess extends HomeState {
  final List<String> currencies;

  HomeGetCurrenciesSuccess(this.currencies);
}

class HomeGetCurrenciesFailure extends HomeState {
  final String message;

  HomeGetCurrenciesFailure(this.message);
}

class HomeConvertCurrencyLoading extends HomeState {}

class HomeConvertCurrencySuccess extends HomeState {
  final double convertedAmount;

  HomeConvertCurrencySuccess(this.convertedAmount);
}

class HomeConvertCurrencyFailure extends HomeState {
  final String message;

  HomeConvertCurrencyFailure(this.message);
}
