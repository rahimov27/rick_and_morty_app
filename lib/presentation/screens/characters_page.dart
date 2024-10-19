import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/data/models/character_model.dart';
import 'package:rick_and_morty_app/presentation/blocs/chars_bloc/chars_bloc.dart';
import 'package:rick_and_morty_app/presentation/screens/character_details_page.dart';
import 'package:rick_and_morty_app/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_app/presentation/widgets/grid_view_widget.dart';
import 'package:rick_and_morty_app/presentation/widgets/list_view_widget.dart';
import 'package:rick_and_morty_app/resources/resources.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CharsBloc>(context).add(GetCharsList());
    super.initState();
  }

  bool isGrid = true;
  int charsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                TextField(
                  onChanged: (value) {
                    BlocProvider.of<CharsBloc>(context).add(
                      GetCharsList(name: value),
                    );
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: AppColors.darkTextEditionColor,
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SvgPicture.asset(
                            Svgs.filter,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        Svgs.search,
                        color: AppColors.grey,
                      ),
                    ),
                    hintText: "Найти персонажа",
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.darkTextEditionColor,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.green,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.darkTextEditionColor,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text(
                      "Всего персонажей: 200",
                      style: TextStyle(color: AppColors.grey),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isGrid = !isGrid;
                        });
                      },
                      icon: isGrid == true
                          ? SvgPicture.asset(Svgs.grid)
                          : SvgPicture.asset(Svgs.list),
                    )
                  ],
                ),
                BlocBuilder<CharsBloc, CharsState>(
                  builder: (context, state) {
                    if (state is CharsSuccess) {
                      return isGrid
                          ? Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           CharacterDetailsPage(
                                          ),
                                    ),
                                  );
                                },
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.8),
                                  itemCount: state.model.results?.length ?? 0,
                                  itemBuilder: (context, index) =>
                                      GridViewWidget(
                                    characters: state.model.results?[index] ??
                                        MyCharacters(),
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.model.results?.length ?? 0,
                                itemBuilder: (context, index) => ListViewWidget(
                                  characters: state.model.results?[index] ??
                                      MyCharacters(),
                                ),
                              ),
                            );
                    } else if (state is CharsError) {
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
                    } else if (state is CharsLoading) {
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
