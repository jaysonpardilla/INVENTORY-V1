import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';
import '../repository/sales_repository.dart';

class AddWeeklySales {
  final SalesRepository repository;
  AddWeeklySales(this.repository);

  Future<Either<Failure, String>> call(WeeklySales sales) async {
    return await repository.addWeeklySales(sales);
  }
}
