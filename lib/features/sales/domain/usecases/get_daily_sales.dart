// import 'package:dartz/dartz.dart';
// import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';
import '../repository/sales_repository.dart';

class GetDailySales {
  final SalesRepository repository;
  GetDailySales(this.repository);

  Stream<List<DailySales>> call(String ownerId) {
    return repository.streamDailySales(ownerId);
  }
}
