import '../models/inventory_transaction.dart';

abstract class TransactionRemoteDataSource {
  Stream<List<InventoryTransactionModel>> streamTransactions(String ownerId, {int limit = 50});
  Future<void> purchaseItems(String ownerId, List<Map<String, dynamic>> items);
}
