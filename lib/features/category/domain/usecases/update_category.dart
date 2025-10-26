import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class UpdateCategory {
  final CategoryRepository repository;
  UpdateCategory(this.repository);

  Future<Either<Failure, void>> call(Category category) async {
    return await repository.updateCategory(category);
  }
}
