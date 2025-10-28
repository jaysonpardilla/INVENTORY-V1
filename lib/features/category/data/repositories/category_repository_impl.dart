import 'package:dartz/dartz.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_remote_data_source.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<Category>> streamCategories(String ownerId) {
    return remoteDataSource.streamCategories(ownerId);
  }

  @override
  Future<Either<Failure, String>> addCategory(Category category) async {
    try {
      final id = await remoteDataSource.addCategory(CategoryModel(
        id: category.id,
        ownerId: category.ownerId,
        name: category.name,
      ));
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('Failed to add category: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(Category category) async {
    try {
      await remoteDataSource.updateCategory(CategoryModel(
        id: category.id,
        ownerId: category.ownerId,
        name: category.name,
      ));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update category: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String id) async {
    try {
      await remoteDataSource.deleteCategory(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete category: $e'));
    }
  }
}
