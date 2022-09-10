import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 215,
      height: double.infinity,
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 145,
              padding: const EdgeInsets.only(left: 25, top: 15),
              child: SvgPicture.asset('assets/spotify-logo-copy.svg'),
            ),
            buildListTileIconFixed(0, Icons.home_filled, Colors.white, 'Início',Colors.white),
            buildListTileIconFixed(
                0, Icons.search_outlined, Colors.grey, 'Buscar',Colors.white70),
            buildListTileIconFixed(
                1.56, Icons.menu_outlined, Colors.grey, 'Sua Biblioteca',Colors.white70),
            const SizedBox(
              height: 17,
            ),
            buildListTilePersonIcon(
              BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.grey),
              Icons.add,
              Colors.black,
              'Criar playlist',
            ),
            buildListTilePersonIcon(
              BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color.fromRGBO(77, 23, 241, 1), Colors.grey]),
              ),
              Icons.favorite,
              Colors.white70,
              'Músicas Curtidas',
            ),
            buildListTilePersonIcon(
              BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: const Color.fromARGB(98, 102, 187, 106),
              ),
              Icons.bookmark,
              Colors.green,
              'Seus episódios',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.white24,
              ),
            ),
            SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    buildListTileWithoutIcon('Louvor'),
                    buildListTileWithoutIcon('Pop'),
                    buildListTileWithoutIcon('Blues/jazz'),
                    buildListTileWithoutIcon('Rock'),
                    buildListTileWithoutIcon('Old Metal'),
                    buildListTileWithoutIcon('Melodic Metal'),
                    buildListTileWithoutIcon('MPB'),
                    buildListTileWithoutIcon('Gospel'),
                  ],
                ),
              ),
            ),
            buildListTileIconFixed(0, Icons.arrow_circle_down, Colors.grey, 'Instalar aplicativo',Colors.white70),
          ],
        ),
      ),
    );
  }

  Widget buildListTileWithoutIcon(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Text(text,style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }

  ListTile buildListTileIconFixed(
      double angle, IconData icon, Color color, String text, Color colorFont) {
    return ListTile(
      horizontalTitleGap: 0,
      minVerticalPadding: 0,
      visualDensity: const VisualDensity(vertical: -4),
      leading: Transform.rotate(
        angle: angle,
        child: Icon(
          icon,
          color: color,
          size: 25,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: colorFont,
          fontSize: 12,
        ),
      ),
    );
  }

  ListTile buildListTilePersonIcon(
      BoxDecoration boxDecoration, IconData icon, Color color, String text) {
    return ListTile(
      horizontalTitleGap: 0,
      minVerticalPadding: 0,
      visualDensity: const VisualDensity(vertical: -4),
      leading: Container(
        width: 21,
        height: 21,
        decoration: boxDecoration,
        child: Icon(
          icon,
          color: color,
          size: 15,
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
        ),
      ),
    );
  }
}
