import '../models/daily_sales_model.dart';
import '../models/weekly_sales_model.dart';
import '../models/monthly_sales_model.dart';
import '../models/total_sales_model.dart';

abstract class SalesRemoteDataSource {
  Stream<List<DailySalesModel>> streamDailySales(String ownerId);
  Stream<List<WeeklySalesModel>> streamWeeklySales(String ownerId);
  Stream<List<MonthlySalesModel>> streamMonthlySales(String ownerId);
  Stream<List<TotalSalesModel>> streamTotalSales(String ownerId);

  Future<String> addDailySales(DailySalesModel sales);
  Future<String> addWeeklySales(WeeklySalesModel sales);
  Future<String> addMonthlySales(MonthlySalesModel sales);
  Future<String> addTotalSales(TotalSalesModel sales);

  Future<void> deleteSalesRecord(String id);
}
