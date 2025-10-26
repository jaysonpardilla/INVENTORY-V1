// import 'package:dartz/dartz.dart';
// import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';
import '../repository/sales_repository.dart';

class GetWeeklySales {
  final SalesRepository repository;
  GetWeeklySales(this.repository);

  Stream<List<WeeklySales>> call(String ownerId) {
    return repository.streamWeeklySales(ownerId);
  }
}
