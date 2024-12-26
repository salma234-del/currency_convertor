import 'package:currency/Features/home/data/home_repo.dart';
import 'package:currency/Features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  HomeRepo homeRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  List<String> currencies = [];

  String fromCurrency = 'egp';
  String toCurrency = 'eur';
  double convertedAmount = 0.0;

  void changeAutoValidateMode() {
    autovalidateMode = autovalidateMode == AutovalidateMode.disabled
        ? AutovalidateMode.always
        : AutovalidateMode.disabled;
    emit(HomeChangeAutoValidateMode());
  }

  void changeFromCurrency(String currency) {
    fromCurrency = currency;
    emit(HomeChangeFromCurrency());
  }

  void changeToCurrency(String currency) {
    toCurrency = currency;
    emit(HomeChangeToCurrency());
  }

  Future<void> getCurrencies() async {
    emit(HomeGetCurrenciesLoading());
    var response = await homeRepo.getCurrencies();
    response.fold(
      (failure) => emit(HomeGetCurrenciesFailure(failure.message)),
      (currencies) {
        this.currencies = currencies;
        emit(HomeGetCurrenciesSuccess(currencies));
      },
    );
  }

  Future<void> convertCurrency() async {
    emit(HomeConvertCurrencyLoading());
    var response = await homeRepo.convertCurrency(
      from: fromCurrency,
      to: toCurrency,
    );
    response.fold(
      (failure) => emit(HomeConvertCurrencyFailure(failure.message)),
      (convertedAmount) {
        this.convertedAmount = convertedAmount;
        emit(HomeConvertCurrencySuccess(convertedAmount));
      },
    );
  }
}
