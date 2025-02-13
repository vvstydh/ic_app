// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_theme.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HourTheme on HourThemeStore, Store {
  late final _$hourThemeListAtom =
      Atom(name: 'HourThemeStore.hourThemeList', context: context);

  @override
  ObservableList<Map<String, dynamic>> get hourThemeList {
    _$hourThemeListAtom.reportRead();
    return super.hourThemeList;
  }

  @override
  set hourThemeList(ObservableList<Map<String, dynamic>> value) {
    _$hourThemeListAtom.reportWrite(value, super.hourThemeList, () {
      super.hourThemeList = value;
    });
  }

  @override
  String toString() {
    return '''
hourThemeList: ${hourThemeList}
    ''';
  }
}
