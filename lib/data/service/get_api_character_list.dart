import 'dart:convert';

import 'package:flutter_app_marvel/constant/api_value.dart';
import 'package:flutter_app_marvel/constant/keys.dart';
import 'package:flutter_app_marvel/domain/model/model_character_list.dart';
import 'package:http/http.dart' as http;

class GetCharacterList {
  Future<CharacterListModel> callApi({int? index = 777}) async {
    final request = http.Request(
      ApiValue.get,
      Uri.parse(
        "${ApiValue.baseUrl}${ApiValue.characters}${ApiValue.limit}${MyKeys.call}"
      )
    );
    http.StreamedResponse response = await request.send();
    String str = await response.stream.bytesToString();
    dynamic data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return CharacterListModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
