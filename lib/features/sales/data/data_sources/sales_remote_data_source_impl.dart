import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/daily_sales_model.dart';
import '../models/weekly_sales_model.dart';
import '../models/monthly_sales_model.dart';
import '../models/total_sales_model.dart';
import 'sales_remote_data_source.dart';

class SalesRemoteDataSourceImpl implements SalesRemoteDataSource {
  final FirebaseFirestore firestore;

  SalesRemoteDataSourceImpl(this.firestore);

  CollectionReference get _daily => firestore.collection('daily_sales');
  CollectionReference get _weekly => firestore.collection('weekly_sales');
  CollectionReference get _monthly => firestore.collection('monthly_sales');
  CollectionReference get _total => firestore.collection('total_sales');

  @override
  Stream<List<DailySalesModel>> streamDailySales(String ownerId) {
    return _daily
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => DailySalesModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
            .toList());
  }

  @override
  Stream<List<WeeklySalesModel>> streamWeeklySales(String ownerId) {
    return _weekly
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => WeeklySalesModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
            .toList());
  }

  @override
  Stream<List<MonthlySalesModel>> streamMonthlySales(String ownerId) {
    return _monthly
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MonthlySalesModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
            .toList());
  }

  @override
  Stream<List<TotalSalesModel>> streamTotalSales(String ownerId) {
    return _total
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TotalSalesModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
            .toList());
  }

  @override
  Future<String> addDailySales(DailySalesModel sales) async {
    final ref = _daily.doc();
    await firestore.runTransaction((tx) async {
      tx.set(ref, sales.toMap());
    });
    return ref.id;
  }

  @override
  Future<String> addWeeklySales(WeeklySalesModel sales) async {
    final ref = _weekly.doc();
    await firestore.runTransaction((tx) async {
      tx.set(ref, sales.toMap());
    });
    return ref.id;
  }

  @override
  Future<String> addMonthlySales(MonthlySalesModel sales) async {
    final ref = _monthly.doc();
    await firestore.runTransaction((tx) async {
      tx.set(ref, sales.toMap());
    });
    return ref.id;
  }

  @override
  Future<String> addTotalSales(TotalSalesModel sales) async {
    final ref = _total.doc();
    await firestore.runTransaction((tx) async {
      tx.set(ref, sales.toMap());
    });
    return ref.id;
  }

  @override
  Future<void> deleteSalesRecord(String id) async {
    await _daily.doc(id).delete();
    await _weekly.doc(id).delete();
    await _monthly.doc(id).delete();
    await _total.doc(id).delete();
  }
}
