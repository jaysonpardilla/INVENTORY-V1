import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../repositories/category_repository.dart';

class DeleteCategory {
  final CategoryRepository repository;
  DeleteCategory(this.repository);

  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteCategory(id);
  }
}
