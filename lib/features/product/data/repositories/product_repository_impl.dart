import 'package:dartz/dartz.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../../../../core/error/failure.dart';
import '../models/product_model.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<Product>> streamProducts(String ownerId) {
    return remoteDataSource.streamProducts(ownerId);
  }

  @override
  Future<Either<Failure, String>> addProduct(Product product) async {
    try {
      final model = ProductModel(
        id: product.id,
        ownerId: product.ownerId,
        name: product.name,
        categoryId: product.categoryId,
        supplierId: product.supplierId,
        price: product.price,
        quantityInStock: product.quantityInStock,
        quantityBuyPerItem: product.quantityBuyPerItem,
        imageUrl: product.imageUrl,
      );
      final id = await remoteDataSource.addProduct(model);
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('Add product failed: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    try {
      final model = ProductModel(
        id: product.id,
        ownerId: product.ownerId,
        name: product.name,
        categoryId: product.categoryId,
        supplierId: product.supplierId,
        price: product.price,
        quantityInStock: product.quantityInStock,
        quantityBuyPerItem: product.quantityBuyPerItem,
        imageUrl: product.imageUrl,
      );
      await remoteDataSource.updateProduct(model);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Update product failed: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
      await remoteDataSource.deleteProduct(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Delete product failed: $e'));
    }
  }
}
