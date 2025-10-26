import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../repositories/supplier_repository.dart';

class DeleteSupplier {
  final SupplierRepository repository;
  DeleteSupplier(this.repository);

  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteSupplier(id);
  }
}
