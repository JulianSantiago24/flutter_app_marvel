import 'package:flutter/material.dart';
import 'package:flutter_app_marvel/domain/model/model_character_list.dart';
import 'package:flutter_app_marvel/providers/provider_character_list.dart';
import 'package:flutter_app_marvel/screens/characters/screen_character_details.dart';
import 'package:flutter_app_marvel/utilities/all_colors.dart';
import 'package:flutter_app_marvel/utilities/all_texts.dart';
import 'package:flutter_app_marvel/utilities/image_path.dart';
import 'package:flutter_app_marvel/widgets/custom_error_dialogue.dart';
import 'package:flutter_app_marvel/widgets/custom_list_container.dart';
import 'package:flutter_app_marvel/widgets/grid_view_fixed_height.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterList extends ConsumerStatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  ConsumerState<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends ConsumerState<CharacterList> {

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(characterListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AllTexts.marvelCharacters),
      ),
      body: CustomListContainer.get(
        context: context,
        backgroundImagePath: ImagePath.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: data.when(
                    data: (data) {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const GridViewFixedHeight(
                          crossAxisCount: 2,
                          height: 200,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: data.data!.results!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              _characterCard(value: data, index: index),
                            ],
                          );
                        },
                      );
                    },
                    error: (err, s) => ErrorDialogue.view(context: context),
                    loading: () => Center(
                      child: Image.asset(
                        ImagePath.loader,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _characterCard({
    required CharacterListModel value,
    required int index
  }) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (builder) => CharacterDetailsScreen(id: value.data!.results![index].id!),
        //   ),
        // );
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 3000),
            pageBuilder: (context, animation, __){
              return FadeTransition(
                opacity: animation, 
                child: CharacterDetailsScreen(
                  id: value.data!.results![index].id!
                )
              );
            }
          )
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.70),
          borderRadius: const BorderRadius.all(
            Radius.elliptical(
              300,
              130
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // iamge
            Container(
              height: 145,
              decoration: BoxDecoration(
                  color: AllColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      15,
                    ),
                    topRight: Radius.circular(
                      15,
                    ),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                          '${value.data!.results![index].thumbnail!.path!}.${value.data!.results![index].thumbnail!.extension!}'),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                value.data!.results![index].name!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}