import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';
import '../repository/sales_repository.dart';

class AddMonthlySales {
  final SalesRepository repository;
  AddMonthlySales(this.repository);

  Future<Either<Failure, String>> call(MonthlySales sales) async {
    return await repository.addMonthlySales(sales);
  }
}
