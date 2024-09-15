import 'package:bibliasagrada/shared/routes/routes_named.dart';
import 'package:bibliasagrada/src/features/presenter/home/widgets/menu_item_widget.dart';
import 'package:bibliasagrada/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part '../helpers/home_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bíblia Sagrada',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xfff1af09),
        centerTitle: true,
      ),
      body: Semantics(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(),
              Row(
                children: [
                  MenuItemWidget(
                    icons: Icons.list,
                    title: 'Bíblia Sagrada',
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutesNamed.biblePage,
                    ),
                  ),
                  MenuItemWidget(
                    icons: Icons.format_quote,
                    title: 'Palavra do dia',
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutesNamed.wordOftheDay,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  MenuItemWidget(
                    icons: Icons.list_alt,
                    title: 'Temas Bíblicos\n',
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutesNamed.biblicalThemas,
                    ),
                  ),
                  MenuItemWidget(
                    icons: Icons.my_library_books,
                    title: 'Versículos\n Marcados',
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutesNamed.saveVerses,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
