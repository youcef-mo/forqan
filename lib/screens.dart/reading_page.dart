import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class SurahPage extends StatelessWidget {
  final int index;
  SurahPage({@required this.index});
  @override
  Widget build(BuildContext context) {
    int count = quran.getVerseCount(index + 1);
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 26.0,
          ),
          SafeArea(
            minimum: EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  for (var i = 1; i <= count; i++) ...{
                    TextSpan(
                      text: quran.getVerse(index + 1, i, verseEndSymbol: false),
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'kitab'),
                    ),
                    TextSpan(
                      text: quran.getVerseEndSymbol(i),
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'kitab',
                      ),
                    ),
                  }
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
