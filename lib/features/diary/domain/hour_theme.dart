import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'hour_theme.g.dart';

class HourTheme = HourThemeStore with _$HourTheme;

abstract class HourThemeStore with Store {
  var supabase = Supabase.instance.client;

  @observable
  ObservableList<Map<String, dynamic>> hourThemeList =
      ObservableList<Map<String, dynamic>>();

  Future<void> getThemeList() async {
    hourThemeList.clear();
    hourThemeList.addAll(await fetchThemeList());
  }

  Future<Iterable<Map<String, dynamic>>> fetchThemeList() async {
    final response = await supabase.from('curatorial_hours').select('*');
    return List<Map<String, dynamic>>.from(response);
  }
}
