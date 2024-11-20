import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/pages/character_details_page.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/widgets/text_field_character_widget.dart';
import 'package:rick_and_morty_app/shared/theme/app_colors.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/widgets/grid_view_widget.dart';
import 'package:rick_and_morty_app/features/chararcter/presentation/widgets/list_view_widget.dart';
import 'package:rick_and_morty_app/shared/resources/resources.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final TextEditingController controller = TextEditingController();
  bool isGrid = true;

  @override
  void initState() {
    BlocProvider.of<CharacterBloc>(context).add(LoadCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextFieldCharacterWidget(controller: controller),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BlocBuilder<CharacterBloc, CharacterState>(
                      builder: (context, state) {
                        if (state is CharacterLoaded) {
                          return Text(
                            "Всего персонажей: ${state.characters.length}",
                            style: const TextStyle(color: AppColors.grey),
                          );
                        }
                        return const Text(
                          "Загрузка персонажей...",
                          style: TextStyle(color: AppColors.grey),
                        );
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isGrid = !isGrid;
                        });
                      },
                      icon: SvgPicture.asset(isGrid ? Svgs.grid : Svgs.list),
                    ),
                  ],
                ),
                BlocBuilder<CharacterBloc, CharacterState>(
                  builder: (context, state) {
                    if (state is CharacterLoaded) {
                      return Expanded(
                        child: isGrid
                            ? GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                ),
                                itemCount: state.characters.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CharacterDetailsPage(
                                        characterEntity:
                                            state.characters[index],
                                      ),
                                    ),
                                  ),
                                  child: GridViewWidget(
                                    characterEntity: state.characters[index],
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.characters.length,
                                itemBuilder: (context, index) => ListViewWidget(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CharacterDetailsPage(
                                          characterEntity:
                                              state.characters[index],
                                        ),
                                      ),
                                    );
                                  },
                                  characterEntity: state.characters[index],
                                ),
                              ),
                      );
                    } else if (state is CharacterError) {
                      return Center(
                        child: Column(
                          children: [
                            Image.asset(
                              Pngs.notFound,
                              width: MediaQuery.of(context).size.width * 0.50,
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(
                              width: 200,
                              child: Text(
                                "Персонаж с таким именем не найден",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: AppColors.grey),
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (state is CharacterLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.green,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
