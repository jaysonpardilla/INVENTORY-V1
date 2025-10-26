// import 'package:dartz/dartz.dart';
// import '../../../../../core/error/failure.dart';
import '../entities/sales_summary.dart';
import '../repository/sales_repository.dart';

class GetMonthlySales {
  final SalesRepository repository;
  GetMonthlySales(this.repository);

  Stream<List<MonthlySales>> call(String ownerId) {
    return repository.streamMonthlySales(ownerId);
  }
}
