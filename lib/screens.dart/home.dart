import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forqan/screens.dart/reading_page.dart';
import 'package:backdrop/backdrop.dart';
import 'package:quran/quran.dart' as quran;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List items = [];
  List tabs = [];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/surah.json');
    final data = await json.decode(response);
    setState(() {
      items = data["chapters"];
    });
  }

  final List<Widget> _pages = List.generate(
      114,
      (index) => SurahPage(
            index: index,
          ));
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Forqan"),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      stickyFrontLayer: true,
      subHeader: basmalla(),
      frontLayer: _pages[selectedIndex],
      backLayer: BackdropNavigationBackLayer(
        items: List.generate(
          114,
          (index) {
            return ListTile(
              title: Text(items[index]["name_simple"]),
              trailing: Text(
                items[index]["name_arabic"],
                style: TextStyle(
                  fontFamily: 'Aldhabi',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            );
          },
        ),
        onTap: (int index) => {setState(() => selectedIndex = index)},
      ),
    );
  }

  Widget basmalla() {
    return Container(
      height: 150,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Column(
          children: [
            Text(
              items[selectedIndex]["name_arabic"],
              style: TextStyle(
                fontFamily: 'Aldhabi',
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
            ),
            Text(
              quran.getBasmala(),
              style: TextStyle(
                fontFamily: 'Aldhabi',
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
