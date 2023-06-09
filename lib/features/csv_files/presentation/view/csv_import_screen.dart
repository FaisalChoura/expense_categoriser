import 'package:expense_categoriser/features/csv_files/data/data_module.dart';
import 'package:expense_categoriser/features/csv_files/presentation/viewmodel/csv_files_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CsvImportScreen extends ConsumerWidget {
  const CsvImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final csvFiles = ref.watch(csvFilesStoreProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('CSV import')),
        body: Column(
          children: [
            for (var file in csvFiles)
              MaterialButton(
                  child: Text(file.name),
                  onPressed: () =>
                      ref.read(csvFilesViewModelProvider).removeFile(file)),
            Center(
              child: MaterialButton(
                child: const Text('load CSV'),
                onPressed: () async {
                  ref.read(csvFilesViewModelProvider).importFiles();
                },
              ),
            ),
          ],
        ));
  }
}
