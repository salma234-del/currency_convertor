import 'package:currency/Features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class CurrenciesDropdownButtonsSection extends StatelessWidget {
  const CurrenciesDropdownButtonsSection({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton<String>(
          items: cubit.currencies.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: cubit.fromCurrency,
          onChanged: (String? value) {
            cubit.changeFromCurrency(value!);
          },
        ),
        Icon(
          Icons.arrow_forward,
          color: Theme.of(context).primaryColor,
        ),
        DropdownButton<String>(
          items: cubit.currencies.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: cubit.toCurrency,
          onChanged: (String? value) {
            cubit.changeToCurrency(value!);
          },
        ),
      ],
    );
  }
}
