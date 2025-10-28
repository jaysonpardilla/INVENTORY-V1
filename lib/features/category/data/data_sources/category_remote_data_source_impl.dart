import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';
import 'category_remote_data_source.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final FirebaseFirestore firestore;

  CategoryRemoteDataSourceImpl(this.firestore);

  CollectionReference get _categories =>
      firestore.collection('categories');

  @override
  Stream<List<CategoryModel>> streamCategories(String ownerId) {
    return _categories
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                CategoryModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
            .toList());
  }

  @override
  Future<String> addCategory(CategoryModel category) async {
    final docRef = await _categories.add(category.toMap());
    return docRef.id;
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await _categories.doc(category.id).update(category.toMap());
  }

  @override
  Future<void> deleteCategory(String id) async {
    await _categories.doc(id).delete();
  }
}
