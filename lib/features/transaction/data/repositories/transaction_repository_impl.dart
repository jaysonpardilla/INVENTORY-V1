import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/inventory_transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../data_sources/transaction_remote_data_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<InventoryTransaction>> streamTransactions(String ownerId, {int limit = 50}) {
    return remoteDataSource.streamTransactions(ownerId, limit: limit);
  }

  @override
  Future<Either<Failure, void>> purchaseItems(String ownerId, List<Map<String, dynamic>> items) async {
    try {
      await remoteDataSource.purchaseItems(ownerId, items);
      return const Right(null);
    } on ServerException catch (e) {
      // ServerException has a positional message: ServerException([this.message])
      return Left(ServerFailure(e.message));
    } catch (e) {
      // Fallback to a ServerFailure with the toString() message
      return Left(ServerFailure(e.toString()));
    }
  }
}
