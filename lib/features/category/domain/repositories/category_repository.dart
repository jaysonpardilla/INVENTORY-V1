import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Stream<List<Category>> streamCategories(String ownerId);
  Future<Either<Failure, String>> addCategory(Category category);
  Future<Either<Failure, void>> updateCategory(Category category);
  Future<Either<Failure, void>> deleteCategory(String id);
}
