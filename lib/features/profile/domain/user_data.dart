import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_data.g.dart';

class UserData = UserDataStore with _$UserData;

abstract class UserDataStore with Store {
  @observable
  bool passwordVisibility = true;

  @observable
  bool emailConfirmed = false;

  var supabase = Supabase.instance.client;

  @observable
  User? user;

  @observable
  // ignore: avoid_init_to_null
  var userData = null;

  @observable
  String selectedCourse = 'none';

  @observable
  ObservableList<String> groups = ObservableList<String>();

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
      if (res.user != null) {
        user = res.user;
        await getUserData();
      } else {
        throw Exception('Пользователь не найден');
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<void> getUserData() async {
    userData =
        await supabase.from('userdata').select().eq('uid', user!.id).single();
    groups.addAll(userData['groups'].split(',').toList());
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    user = null;
    userData = null;
  }

  Future<void> uploadAvatar() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;

      final user = supabase.auth.currentUser;
      if (user == null) throw 'Пользователь не авторизован';

      final fileName = '${user.id}.jpg';
      final file = File(image.path);

      await supabase.storage.from('avatars').remove([fileName]);

      await supabase
          .from('userdata')
          .update({'avatar_url': null}).eq('uid', user.id); //

      print('object');

      await supabase.storage.from('avatars').upload(
            fileName,
            file,
            fileOptions: const FileOptions(upsert: true),
          );

      final avatarUrl = supabase.storage.from('avatars').getPublicUrl(fileName);

      await getUserData();

      await supabase
          .from('userdata')
          .update({'avatar_url': avatarUrl}).eq('uid', user.id);

      await getUserData();
    } catch (e) {
      print('Ошибка загрузки аватара: $e');
      return null;
    }
  }
}
