// import 'package:dartz/dartz.dart';
// import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';
import '../repository/sales_repository.dart';

class GetTotalSales {
  final SalesRepository repository;
  GetTotalSales(this.repository);

  Stream<List<TotalSales>> call(String ownerId) {
    return repository.streamTotalSales(ownerId);
  }
}
