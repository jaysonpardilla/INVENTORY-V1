import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../repository/sales_repository.dart';

class DeleteSalesRecord {
  final SalesRepository repository;
  DeleteSalesRecord(this.repository);

  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteSalesRecord(id);
  }
}
