import 'package:flutter/material.dart';
import 'package:spotify_clone_web_ui/pages/playlist_page.dart';

class ComponentWidgetPlaylistItem extends StatelessWidget {
  const ComponentWidgetPlaylistItem({
    Key? key,
    required this.widthtPage,
    required this.namePlaylist,
    required this.capaPlaylist,
    required this.descriptionPlaylist,
  }) : super(key: key);

  final double widthtPage;
  final String namePlaylist;
  final String capaPlaylist;
  final String descriptionPlaylist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistPage(
              namePlaylist: namePlaylist,
              capaPlaylist: capaPlaylist,
              descriptionPlaylist: descriptionPlaylist,
            ),
          ),
        );
      },
      child: Container(
        height: 70,
        width: widthtPage >= 1350.0
            ? widthtPage * .27
            : widthtPage >= 1039.0
                ? widthtPage * .47
                : widthtPage * .90,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 51, 51, 51),
          border: Border.all(
            color: const Color.fromARGB(255, 51, 51, 51),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                child: Image.network(
                  capaPlaylist,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  child: Text(
                    namePlaylist,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
