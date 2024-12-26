import 'package:currency/Core/functions/calculate_converted_amount.dart';
import 'package:currency/Core/utils/app_text_styles.dart';
import 'package:currency/Features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class ConvertedAmountText extends StatelessWidget {
  const ConvertedAmountText({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Text(
      calculateConvertedAmount(
        amount: double.parse(
          cubit.amountController.text == ''
              ? '0'
              : cubit.amountController.text,
        ),
        rate: cubit.convertedAmount,
      ).toString(),
      style: AppTextStyles.textStyle24,
    );
  }
}