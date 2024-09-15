import 'package:bibliasagrada/shared/routes/routes_named.dart';
import 'package:bibliasagrada/src/features/presenter/themes/pages/cubits/list_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({super.key});

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  late final ListThemeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ListThemeCubit>()..getListTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temas Bíblicos',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Semantics(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ListThemeCubit, ListThemeState>(
            bloc: cubit,
            builder: (context, state) {
              return switch (state) {
                ListThemeInitialState() => const SizedBox(),
                ListThemeLoadingState() => const SizedBox.expand(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                        semanticsLabel: 'Carregando...',
                        strokeWidth: 5,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ListThemeLoadedState() => ListView.separated(
                    itemCount: state.listThemeEntity.listTheme.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                    itemBuilder: (context, index) {
                      final theme = state.listThemeEntity.listTheme[index];
                      return GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                          RoutesNamed.themeVerses,
                          arguments: {'themeId': theme.id},
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.amberAccent),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              theme.description,
                              style: GoogleFonts.montserrat(
                                height: 1.2,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ListThemeErrorState() => const SizedBox()
              };
            },
          ),
        ),
      ),
    );
  }
}
