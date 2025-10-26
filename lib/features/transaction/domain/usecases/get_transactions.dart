// import 'package:dartz/dartz.dart';
// import '../../../../../core/error/failure.dart';
import '../entities/inventory_transaction.dart';
import '../repositories/transaction_repository.dart';

class GetTransactions {
  final TransactionRepository repository;
  GetTransactions(this.repository);

  Stream<List<InventoryTransaction>> call(String ownerId, {int limit = 50}) {
    return repository.streamTransactions(ownerId, limit: limit);
  }
}
