import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';
import '../repository/sales_repository.dart';

class AddTotalSales {
  final SalesRepository repository;
  AddTotalSales(this.repository);

  Future<Either<Failure, String>> call(TotalSales sales) async {
    return await repository.addTotalSales(sales);
  }
}
