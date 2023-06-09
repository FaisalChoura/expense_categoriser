import 'package:expense_categoriser/features/reports/domain/enum/numbering_style.dart';

class CsvImportSettings {
  String fieldDelimiter = ',';
  String endOfLine = '\n';
  NumberingStyle numberStyle = NumberingStyle.eu; // field needs to be parsed
  FieldIndexes fieldIndexes = FieldIndexes();
}

class FieldIndexes {
  int dateField = 0;
  int amountField = 1;
  int descriptionField = 2;
}
