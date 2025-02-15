// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiaryData on DiaryDataStore, Store {
  late final _$diaryDataAtom =
      Atom(name: 'DiaryDataStore.diaryData', context: context);

  @override
  ObservableList<Map<String, dynamic>> get diaryData {
    _$diaryDataAtom.reportRead();
    return super.diaryData;
  }

  @override
  set diaryData(ObservableList<Map<String, dynamic>> value) {
    _$diaryDataAtom.reportWrite(value, super.diaryData, () {
      super.diaryData = value;
    });
  }

  @override
  String toString() {
    return '''
diaryData: ${diaryData}
    ''';
  }
}
