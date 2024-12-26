import 'package:currency/Core/global/failures/failure.dart';
import 'package:currency/Core/services/api_service.dart';
import 'package:currency/Core/utils/api_constants.dart';
import 'package:currency/Features/home/data/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, double>> convertCurrency({
    required String from,
    required String to,
  }) async {
    var response = await apiService.get(
      endPoint: '${ApiConstants.convertEndpoint}/$from.json',
    );

    if (response.statusCode == 200) {
      return Right(response.data[from][to]);
    } else {
      return Left(
        Failure('Failed to convert currency'),
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCurrencies() async {
    var response =
        await apiService.get(endPoint: ApiConstants.currenciesEndpoint);

    if (response.statusCode == 200) {
      List<String> currencies = [];
      response.data.forEach((key, value) {
        currencies.add(key);
      });
      return Right(currencies);
    } else {
      return Left(
        Failure('Failed to fetch currencies'),
      );
    }
  }
}
