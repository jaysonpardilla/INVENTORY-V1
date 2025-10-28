import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/sales_summary.dart';
import '../../domain/repository/sales_repository.dart';
import '../data_sources/sales_remote_data_source.dart';
import '../models/daily_sales_model.dart';
import '../models/weekly_sales_model.dart';
import '../models/monthly_sales_model.dart';
import '../models/total_sales_model.dart';

class SalesRepositoryImpl implements SalesRepository {
  final SalesRemoteDataSource remoteDataSource;

  SalesRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<DailySales>> streamDailySales(String ownerId) =>
      remoteDataSource.streamDailySales(ownerId);

  @override
  Stream<List<WeeklySales>> streamWeeklySales(String ownerId) =>
      remoteDataSource.streamWeeklySales(ownerId);

  @override
  Stream<List<MonthlySales>> streamMonthlySales(String ownerId) =>
      remoteDataSource.streamMonthlySales(ownerId);

  @override
  Stream<List<TotalSales>> streamTotalSales(String ownerId) =>
      remoteDataSource.streamTotalSales(ownerId);

  @override
  Future<Either<Failure, String>> addDailySales(DailySales sales) async {
    try {
      final id = await remoteDataSource.addDailySales(DailySalesModel(
        id: sales.id,
        date: sales.date,
        salesAmount: sales.salesAmount,
        ownerId: sales.ownerId,
      ));
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('Failed to add daily sales: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> addWeeklySales(WeeklySales sales) async {
    try {
      final id = await remoteDataSource.addWeeklySales(WeeklySalesModel(
        id: sales.id,
        year: sales.year,
        weekNumber: sales.weekNumber,
        salesAmount: sales.salesAmount,
        ownerId: sales.ownerId,
      ));
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('Failed to add weekly sales: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> addMonthlySales(MonthlySales sales) async {
    try {
      final id = await remoteDataSource.addMonthlySales(MonthlySalesModel(
        id: sales.id,
        year: sales.year,
        month: sales.month,
        salesAmount: sales.salesAmount,
        ownerId: sales.ownerId,
      ));
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('Failed to add monthly sales: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> addTotalSales(TotalSales sales) async {
    try {
      final id = await remoteDataSource.addTotalSales(TotalSalesModel(
        id: sales.id,
        productId: sales.productId,
        salesPerItem: sales.salesPerItem,
        totalSales: sales.totalSales,
        ownerId: sales.ownerId,
      ));
      return Right(id);
    } catch (e) {
      return Left(ServerFailure('Failed to add total sales: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSalesRecord(String id) async {
    try {
      await remoteDataSource.deleteSalesRecord(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete sales record: $e'));
    }
  }
}
