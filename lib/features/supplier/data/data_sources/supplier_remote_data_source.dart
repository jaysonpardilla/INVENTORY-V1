import '../models/supplier_model.dart';

abstract class SupplierRemoteDataSource {
  Stream<List<SupplierModel>> streamSuppliers(String ownerId);
  Future<String> addSupplier(SupplierModel supplier);
  Future<void> updateSupplier(SupplierModel supplier);
  Future<void> deleteSupplier(String id);
}
