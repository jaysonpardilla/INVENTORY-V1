import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/inventory_transaction.dart';

abstract class TransactionRepository {
  Stream<List<InventoryTransaction>> streamTransactions(String ownerId, {int limit = 50});
  Future<Either<Failure, void>> purchaseItems(String ownerId, List<Map<String, dynamic>> items);
}
