import 'dart:convert';

import 'package:flutter_app_marvel/constant/api_value.dart';
import 'package:flutter_app_marvel/constant/keys.dart';
import 'package:http/http.dart' as http;

import '../../domain/model/model_character_details.dart';


class GetCharacterDetails {
  Future<CharacterDetailsModel> callApi({required int id}) async {
    final request = http.Request(
        ApiValue.get,
        Uri.parse(
            "${ApiValue.baseUrl}${ApiValue.characters}/$id?${MyKeys.call}"));
    http.StreamedResponse response = await request.send();
    String str = await response.stream.bytesToString();
    dynamic data = jsonDecode(str);
    if (data[ApiValue.code] == ApiValue.getSuccessCode) {
      return CharacterDetailsModel.fromJson(str);
    }
    throw Exception(ApiValue.exceptionMessage);
  }
}
