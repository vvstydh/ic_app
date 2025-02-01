import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_data.g.dart';

class UserData = UserDataStore with _$UserData;

abstract class UserDataStore with Store {
  @observable
  bool passwordVisibility = true;

  var supabase = Supabase.instance.client;

  @observable
  User? user = null;

  @observable
  // ignore: avoid_init_to_null
  var userData = null;

  @observable
  String selectedCourse = 'none';

  @action
  changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
  }

  @action
  void selectCourse(String course) {
    selectedCourse = course;
  }

  void userCheck() {
    user = supabase.auth.currentUser;
  }

  Future<void> signUp(
      String email, String password, String name, String surname) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (res.user != null) {
        await supabase.from('userdata').insert({
          'name': name,
          'surname': surname,
          'uid': res.user!.id,
          'course': selectedCourse
        });
      } else {
        throw Exception('Failed to create user');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print(res.user);
      if (res.user != null) {
        user = res.user;
      } else {
        throw Exception('Пользователь не найден');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    user = null;
    userData = null;
  }
}
