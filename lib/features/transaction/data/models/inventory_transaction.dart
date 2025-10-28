import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/inventory_transaction.dart';

class InventoryTransactionModel extends InventoryTransaction {
  const InventoryTransactionModel({
    required super.id,
    required super.productId,
    required super.transactionType,
    required super.transactionDate,
    required super.amount,
    required super.quantity,
    required super.ownerId,
  });

  factory InventoryTransactionModel.fromMap(Map<String, dynamic> data, String documentId) {
    return InventoryTransactionModel(
      id: documentId,
      productId: data['productId'] ?? '',
      transactionType: data['transactionType'] ?? '',
      transactionDate: (data['transactionDate'] as Timestamp).toDate(),
      amount: (data['amount'] ?? 0).toDouble(),
      quantity: data['quantity'] ?? 0,
      ownerId: data['ownerId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'transactionType': transactionType,
      'transactionDate': transactionDate,
      'amount': amount,
      'quantity': quantity,
      'ownerId': ownerId,
    };
  }
}
