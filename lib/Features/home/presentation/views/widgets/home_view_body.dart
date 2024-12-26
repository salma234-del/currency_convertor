import 'package:currency/Core/utils/app_sizes.dart';
import 'package:currency/Core/utils/app_text.dart';
import 'package:currency/Core/utils/app_text_styles.dart';
import 'package:currency/Core/widgets/custom_error.dart';
import 'package:currency/Core/widgets/custom_loading.dart';
import 'package:currency/Features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:currency/Features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:currency/Features/home/presentation/views/widgets/amount_from.dart';
import 'package:currency/Features/home/presentation/views/widgets/converted_amount_text.dart';
import 'package:currency/Features/home/presentation/views/widgets/currencies_dropdown_buttons_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeGetCurrenciesFailure) {
          CustomError(message: state.message);
        }
        if (state is HomeGetCurrenciesLoading) {
          return const CustomLoading();
        } else {
          var cubit = BlocProvider.of<HomeCubit>(context);
          return GetCurrenciesSuccess(cubit: cubit);
        }
      },
    );
  }
}

class GetCurrenciesSuccess extends StatelessWidget {
  const GetCurrenciesSuccess({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.defaultPadding,
          vertical: AppSizes.defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              AppText.appName,
              style: AppTextStyles.textStyle30,
            ),
            const SizedBox(height: 20),
            const Text(
              AppText.convertFromAnyCurrency,
              style: AppTextStyles.textStyle16,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            AmountForm(cubit: cubit),
            const SizedBox(height: 20),
            CurrenciesDropdownButtonsSection(cubit: cubit),
            const SizedBox(height: 40),
            const Text(
              AppText.convertedAmount,
              style: AppTextStyles.textStyle20,
            ),
            const SizedBox(height: 20),
            ConvertedAmountText(cubit: cubit),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                convertActions();
              },
              child: const Text(AppText.convert),
            ),
          ],
        ),
      ),
    );
  }

  void convertActions() {
    if (cubit.formKey.currentState!.validate()) {
      cubit.convertCurrency();
    } else {
      cubit.changeAutoValidateMode();
    }
  }
}
