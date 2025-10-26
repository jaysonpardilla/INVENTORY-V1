import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class AddCategory {
  final CategoryRepository repository;
  AddCategory(this.repository);

  Future<Either<Failure, String>> call(Category category) async {
    return await repository.addCategory(category);
  }
}
