import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'diary_data.g.dart';

class DiaryData = DiaryDataStore with _$DiaryData;

abstract class DiaryDataStore with Store {
  var supabase = Supabase.instance.client;

  @observable
  ObservableList<Map<String, dynamic>> diaryData =
      ObservableList<Map<String, dynamic>>();

  Future<void> postDiary(
      var user,
      String group,
      String theme,
      String date,
      String description,
      String feeling,
      String behavior,
      String plusMinus,
      String climate,
      String bombing) async {
    await supabase.from('diary').insert({
      'uid': '${user?['uid']}',
      'FIO': '${user?['name']} ${user?['surname']}',
      'group': group,
      'theme': theme,
      'date': date,
      'description': description,
      'feeling': feeling,
      'behavior': behavior,
      'plusMinus': plusMinus,
      'climate': climate,
      'bombing': bombing,
    });
  }

  Future<void> getDiary(
    String? user,
  ) async {
    final res = await supabase.from('diary').select('*').eq('uid', user!);
    diaryData.clear();
    diaryData.addAll(res);
    print(diaryData);
  }
}
