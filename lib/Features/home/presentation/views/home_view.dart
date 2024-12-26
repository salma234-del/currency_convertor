import 'package:currency/Core/services/api_service.dart';
import 'package:currency/Features/home/data/home_repo_impl.dart';
import 'package:currency/Features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:currency/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl(ApiService()))..getCurrencies(),
      child: const SafeArea(
        child: Scaffold(
          body: HomeViewBody(),
        ),
      ),
    );
  }
}
