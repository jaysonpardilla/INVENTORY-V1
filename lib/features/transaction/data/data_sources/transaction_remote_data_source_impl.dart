import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/inventory_transaction.dart';
import 'transaction_remote_data_source.dart';
import '../../../../core/error/exceptions.dart';

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final FirebaseFirestore firestore;

  TransactionRemoteDataSourceImpl(this.firestore);

  @override
  Stream<List<InventoryTransactionModel>> streamTransactions(String ownerId, {int limit = 50}) {
    try {
      return firestore
          .collection('transactions')
          .where('ownerId', isEqualTo: ownerId)
          .orderBy('transactionDate', descending: true)
          .limit(limit)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => InventoryTransactionModel.fromMap(doc.data(), doc.id))
              .toList());
    } catch (e) {
      // wrap and rethrow a ServerException for the repository to handle
      throw ServerException('Failed to stream transactions: $e');
    }
  }

  @override
  Future<void> purchaseItems(String ownerId, List<Map<String, dynamic>> items) async {
    final batch = firestore.batch();

    try {
      for (final item in items) {
        final productRef = firestore.collection('products').doc(item['productId']);
        final transactionRef = firestore.collection('transactions').doc();

        // Note: use your actual field names (quantityInStock vs stockQuantity)
        batch.update(productRef, {
          'quantityInStock': FieldValue.increment(-item['quantity']),
        });

        batch.set(transactionRef, {
          'productId': item['productId'],
          'transactionType': 'purchase',
          'transactionDate': Timestamp.fromDate(DateTime.now()),
          'amount': item['amount'],
          'quantity': item['quantity'],
          'ownerId': ownerId,
        });
      }

      await batch.commit();
    } catch (e) {
      throw ServerException('Failed to purchase items: $e');
    }
  }
}
