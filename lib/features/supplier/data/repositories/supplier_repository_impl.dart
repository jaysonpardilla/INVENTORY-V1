import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/supplier.dart';
import '../../domain/repositories/supplier_repository.dart';
import '../data_sources/supplier_remote_data_source.dart';
import '../models/supplier_model.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  final SupplierRemoteDataSource remoteDataSource;

  SupplierRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<Supplier>> streamSuppliers(String ownerId) {
    return remoteDataSource.streamSuppliers(ownerId);
  }

  @override
  Future<Either<Failure, String>> addSupplier(Supplier supplier) async {
    try {
      final id = await remoteDataSource.addSupplier(SupplierModel(
        id: supplier.id,
        ownerId: supplier.ownerId,
        name: supplier.name,
        contact: supplier.contact,
        address: supplier.address,
      ));
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('Failed to add supplier: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateSupplier(Supplier supplier) async {
    try {
      await remoteDataSource.updateSupplier(SupplierModel(
        id: supplier.id,
        ownerId: supplier.ownerId,
        name: supplier.name,
        contact: supplier.contact,
        address: supplier.address,
      ));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update supplier: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSupplier(String id) async {
    try {
      await remoteDataSource.deleteSupplier(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete supplier: $e'));
    }
  }
}
