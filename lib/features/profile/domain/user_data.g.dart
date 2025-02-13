// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserData on UserDataStore, Store {
  late final _$passwordVisibilityAtom =
      Atom(name: 'UserDataStore.passwordVisibility', context: context);

  @override
  bool get passwordVisibility {
    _$passwordVisibilityAtom.reportRead();
    return super.passwordVisibility;
  }

  @override
  set passwordVisibility(bool value) {
    _$passwordVisibilityAtom.reportWrite(value, super.passwordVisibility, () {
      super.passwordVisibility = value;
    });
  }

  late final _$emailConfirmedAtom =
      Atom(name: 'UserDataStore.emailConfirmed', context: context);

  @override
  bool get emailConfirmed {
    _$emailConfirmedAtom.reportRead();
    return super.emailConfirmed;
  }

  @override
  set emailConfirmed(bool value) {
    _$emailConfirmedAtom.reportWrite(value, super.emailConfirmed, () {
      super.emailConfirmed = value;
    });
  }

  late final _$userAtom = Atom(name: 'UserDataStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$userDataAtom =
      Atom(name: 'UserDataStore.userData', context: context);

  @override
  dynamic get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(dynamic value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  late final _$selectedCourseAtom =
      Atom(name: 'UserDataStore.selectedCourse', context: context);

  @override
  String get selectedCourse {
    _$selectedCourseAtom.reportRead();
    return super.selectedCourse;
  }

  @override
  set selectedCourse(String value) {
    _$selectedCourseAtom.reportWrite(value, super.selectedCourse, () {
      super.selectedCourse = value;
    });
  }

  late final _$groupsAtom =
      Atom(name: 'UserDataStore.groups', context: context);

  @override
  ObservableList<String> get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(ObservableList<String> value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

  late final _$UserDataStoreActionController =
      ActionController(name: 'UserDataStore', context: context);

  @override
  dynamic changePasswordVisibility() {
    final _$actionInfo = _$UserDataStoreActionController.startAction(
        name: 'UserDataStore.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$UserDataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCourse(String course) {
    final _$actionInfo = _$UserDataStoreActionController.startAction(
        name: 'UserDataStore.selectCourse');
    try {
      return super.selectCourse(course);
    } finally {
      _$UserDataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordVisibility: ${passwordVisibility},
emailConfirmed: ${emailConfirmed},
user: ${user},
userData: ${userData},
selectedCourse: ${selectedCourse},
groups: ${groups}
    ''';
  }
}
