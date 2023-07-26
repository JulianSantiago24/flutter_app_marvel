import 'package:flutter_app_marvel/data/service/get_api_character_details.dart';
import 'package:flutter_app_marvel/domain/model/model_character_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterDetails = Provider<GetCharacterDetails>((ref) => GetCharacterDetails());
final characterDetailsProvider = FutureProvider.autoDispose.family<CharacterDetailsModel, int>((ref, id) async{
  return ref.watch(characterDetails).callApi(id: id);
});