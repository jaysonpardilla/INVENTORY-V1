import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';
import '../repository/sales_repository.dart';

class AddDailySales {
  final SalesRepository repository;
  AddDailySales(this.repository);

  Future<Either<Failure, String>> call(DailySales sales) async {
    return await repository.addDailySales(sales);
  }
}
