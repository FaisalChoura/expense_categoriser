import 'package:expense_categoriser/features/categories/domain/model/category.dart';
import 'package:isar/isar.dart';

part 'report_category_snapshot.g.dart';

@embedded
class ReportCategorySnapshot {
  double total = 0;
  String name;
  List<Transaction> transactions = [];
  ColorValues? colorValues;
  ReportCategorySnapshot([this.name = '']);

  factory ReportCategorySnapshot.fromCategory(Category category) {
    final reportCategory = ReportCategorySnapshot(category.name);
    reportCategory.colorValues = category.colorValues;
    return reportCategory;
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
    total = double.parse((total + transaction.amount).toStringAsFixed(2));
  }
}

@embedded
class Transaction {
  String name;
  String date;
  double amount;
  Transaction([this.name = '', this.date = '', this.amount = 0]);
}
