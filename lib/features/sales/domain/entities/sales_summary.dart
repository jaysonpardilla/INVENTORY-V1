import 'package:equatable/equatable.dart';

class DailySales extends Equatable {
  final String id;
  final DateTime date;
  final double salesAmount;
  final String ownerId;

  const DailySales({
    required this.id,
    required this.date,
    required this.salesAmount,
    required this.ownerId,
  });

  @override
  List<Object?> get props => [id, date, salesAmount, ownerId];
}

class WeeklySales extends Equatable {
  final String id;
  final int year;
  final int weekNumber;
  final double salesAmount;
  final String ownerId;

  const WeeklySales({
    required this.id,
    required this.year,
    required this.weekNumber,
    required this.salesAmount,
    required this.ownerId,
  });

  @override
  List<Object?> get props => [id, year, weekNumber, salesAmount, ownerId];
}

class MonthlySales extends Equatable {
  final String id;
  final int year;
  final int month;
  final double salesAmount;
  final String ownerId;

  const MonthlySales({
    required this.id,
    required this.year,
    required this.month,
    required this.salesAmount,
    required this.ownerId,
  });

  @override
  List<Object?> get props => [id, year, month, salesAmount, ownerId];
}

class TotalSales extends Equatable {
  final String id;
  final String? productId;
  final double salesPerItem;
  final double totalSales;
  final String ownerId;

  const TotalSales({
    required this.id,
    this.productId,
    required this.salesPerItem,
    required this.totalSales,
    required this.ownerId,
  });

  @override
  List<Object?> get props => [id, productId, salesPerItem, totalSales, ownerId];
}
