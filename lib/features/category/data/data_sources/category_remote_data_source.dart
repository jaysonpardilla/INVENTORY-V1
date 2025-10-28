import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Stream<List<CategoryModel>> streamCategories(String ownerId);
  Future<String> addCategory(CategoryModel category);
  Future<void> updateCategory(CategoryModel category);
  Future<void> deleteCategory(String id);
}
