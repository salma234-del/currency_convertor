import 'package:currency/Core/global/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<String>>> getCurrencies();
  Future<Either<Failure, double>> convertCurrency({
    required String from,
    required String to,
  });
}
