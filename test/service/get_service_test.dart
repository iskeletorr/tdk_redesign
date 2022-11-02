import 'package:flutter_test/flutter_test.dart';
import 'package:practice_1/model/word_model.dart';
import 'package:practice_1/service/i_get_service.dart';
import 'package:practice_1/util/i_user_preferences.dart';

import '../preferences/preferences_mock.dart';
import 'get_service_mock.dart';

void main() {
  String url = 'https://jsonplaceholder.typicode.com/todos/';
  IGetService service = GetServiceMock();
  IUserPreferences preferences = UserPreferencesMock();
  test('Get Service Test', () async {
    final response = await service.getData(url);
    expect(response, isList);
  });
  test('pref test', () async {
    await preferences.put('shake', WordModel(word: 'example'));
    var a = preferences.get('shake');
    expect(a is WordModel,true);
  });
}
