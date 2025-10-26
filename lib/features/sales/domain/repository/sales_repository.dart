import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';

abstract class SalesRepository {
  /// Stream daily sales for a given owner
  Stream<List<DailySales>> streamDailySales(String ownerId);

  /// Stream weekly sales for a given owner
  Stream<List<WeeklySales>> streamWeeklySales(String ownerId);

  /// Stream monthly sales for a given owner
  Stream<List<MonthlySales>> streamMonthlySales(String ownerId);

  /// Stream total sales for a given owner
  Stream<List<TotalSales>> streamTotalSales(String ownerId);

  /// Add a new daily sales record
  Future<Either<Failure, String>> addDailySales(DailySales sales);

  /// Add a new weekly sales record
  Future<Either<Failure, String>> addWeeklySales(WeeklySales sales);

  /// Add a new monthly sales record
  Future<Either<Failure, String>> addMonthlySales(MonthlySales sales);

  /// Add a total sales record
  Future<Either<Failure, String>> addTotalSales(TotalSales sales);

  /// Delete or reset sales (for example, when clearing a report)
  Future<Either<Failure, void>> deleteSalesRecord(String id);
}
