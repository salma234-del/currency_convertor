import 'package:currency/Core/functions/empty_validator.dart';
import 'package:currency/Core/utils/app_text.dart';
import 'package:currency/Features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class AmountForm extends StatelessWidget {
  const AmountForm({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      autovalidateMode: cubit.autovalidateMode,
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (value) => emptyValidator(value),
        controller: cubit.amountController,
        decoration: const InputDecoration(
          hintText: AppText.amount,
        ),
      ),
    );
  }
}
