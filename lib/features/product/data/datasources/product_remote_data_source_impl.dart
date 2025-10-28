import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final FirebaseFirestore firestore;

  ProductRemoteDataSourceImpl(this.firestore);

  CollectionReference<Map<String, dynamic>> get _collection =>
      firestore.collection('products');

  @override
  Stream<List<ProductModel>> streamProducts(String ownerId) {
    return _collection
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ProductModel.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  @override
  Future<String> addProduct(ProductModel product) async {
    final docRef = _collection.doc();
    await docRef.set(product.toMap()..['id'] = docRef.id);
    return docRef.id;
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    await _collection.doc(product.id).update(product.toMap());
  }

  @override
  Future<void> deleteProduct(String id) async {
    await _collection.doc(id).delete();
  }
}
