import 'package:mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'news_list.g.dart';

class NewsList = NewsListStore with _$NewsList;

abstract class NewsListStore with Store {
  var supabase = Supabase.instance.client;

  @observable
  ObservableList<Map<String, dynamic>> newsList =
      ObservableList<Map<String, dynamic>>();

  Future<void> getNewsList() async {
    newsList.addAll(await fetchNewsList());
  }

  Future<Iterable<Map<String, dynamic>>> fetchNewsList() async {
    final response = await supabase.from('news').select('*');
    newsList.clear();
    return List<Map<String, dynamic>>.from(response);
  }
}
