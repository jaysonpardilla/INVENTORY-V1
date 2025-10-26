import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/supplier.dart';

abstract class SupplierRepository {
  Stream<List<Supplier>> streamSuppliers(String ownerId);
  Future<Either<Failure, String>> addSupplier(Supplier supplier);
  Future<Either<Failure, void>> updateSupplier(Supplier supplier);
  Future<Either<Failure, void>> deleteSupplier(String id);
}
