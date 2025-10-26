import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../repositories/transaction_repository.dart';

class PurchaseItems {
  final TransactionRepository repository;
  PurchaseItems(this.repository);

  Future<Either<Failure, void>> call(String ownerId, List<Map<String, dynamic>> items) async {
    return await repository.purchaseItems(ownerId, items);
  }
}
