import 'package:flutter_app_marvel/data/service/get_api_character_list.dart';
import 'package:flutter_app_marvel/domain/model/model_character_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterList = Provider<GetCharacterList>((ref) => GetCharacterList());
final characterListProvider = FutureProvider.autoDispose<CharacterListModel>((ref) async {
  return ref.watch(characterList).callApi();
});