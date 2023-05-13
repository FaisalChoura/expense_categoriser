import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/categoriser.dart';
import '../../services/csv_reader_service.dart';
import '../../utils/models/category.dart';
import '../../utils/models/transaction.dart';
import '../models/report.dart';

class ReportViewModel {
  Report? report;
  ReportViewModel();
}

class ReportViewModelNotfier extends StateNotifier<ReportViewModel> {
  final CsvReaderService csvReaderService = CsvReaderService();

  ReportViewModelNotfier() : super(ReportViewModel());

  // Future<void> generateReport() {}

  void buildReport(Map<String, List<Transaction>> categorisedTransactions) {
    Report report = Report(0, 0, []);
    for (var categoryName in categorisedTransactions.keys) {
      ReportCategory category =
          ReportCategory(categoryName, categorisedTransactions[categoryName]!);
      report.categories.add(category);
    }
    // TODO find cleaner way to do this
    var currentState = state;
    currentState.report = report;
    state = currentState;
  }

  Future<Map<String, List<Transaction>>> categoriseTransactions(
      List<PlatformFile> files, List<Category> categories) async {
    final data = await csvReaderService.convertFilesToCsv(files);
    Categoriser categoriser = Categoriser(categories);
    return
        // TODO handle multiple files
        await categoriser.categorise(data[0]!);
  }

  bool hasUncategorisedTransactions(categorisedTransactions) {
    return categorisedTransactions['Uncategorised']!.isNotEmpty;
  }
}

final reportViewModel =
    StateNotifierProvider<ReportViewModelNotfier, ReportViewModel>(
        (ref) => ReportViewModelNotfier());