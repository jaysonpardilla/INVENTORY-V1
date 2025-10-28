import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/supplier_model.dart';
import 'supplier_remote_data_source.dart';

class SupplierRemoteDataSourceImpl implements SupplierRemoteDataSource {
  final FirebaseFirestore firestore;

  SupplierRemoteDataSourceImpl(this.firestore);

  CollectionReference get _supplierCollection =>
      firestore.collection('suppliers');

  @override
  Stream<List<SupplierModel>> streamSuppliers(String ownerId) {
    return _supplierCollection
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => SupplierModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
            .toList());
  }

  @override
  Future<String> addSupplier(SupplierModel supplier) async {
    final ref = _supplierCollection.doc();
    await firestore.runTransaction((tx) async {
      tx.set(ref, supplier.toMap());
    });
    return ref.id;
  }

  @override
  Future<void> updateSupplier(SupplierModel supplier) async {
    final ref = _supplierCollection.doc(supplier.id);
    await firestore.runTransaction((tx) async {
      tx.update(ref, supplier.toMap());
    });
  }

  @override
  Future<void> deleteSupplier(String id) async {
    await firestore.runTransaction((tx) async {
      tx.delete(_supplierCollection.doc(id));
    });
  }
}
