import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/supplier.dart';
import '../repositories/supplier_repository.dart';

class AddSupplier {
  final SupplierRepository repository;
  AddSupplier(this.repository);

  Future<Either<Failure, String>> call(Supplier supplier) async {
    return await repository.addSupplier(supplier);
  }
}
