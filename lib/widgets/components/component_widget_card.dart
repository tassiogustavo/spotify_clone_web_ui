import 'package:flutter/material.dart';
import 'package:spotify_clone_web_ui/pages/playlist_page.dart';

import 'component_widget_text_topics.dart';

class ComponentWidgetCard extends StatelessWidget {
  const ComponentWidgetCard({
    Key? key,
    required this.namePlaylist,
    required this.descriptionPlaylist,
    required this.capaPlaylist,
    required this.isBand,
  }) : super(key: key);

  final String namePlaylist;
  final String descriptionPlaylist;
  final String capaPlaylist;
  final bool isBand;

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
        width: 170,
        height: 235,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 33, 33, 33),
          border: Border.all(
            color: const Color.fromARGB(255, 33, 33, 33),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 140,
                margin: const EdgeInsets.only(
                  top: 13,
                  left: 13,
                  right: 13,
                ),
                decoration: isBand
                    ? BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 51, 51, 51),
                        ),
                        shape: BoxShape.circle,
                      )
                    : BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 51, 51, 51),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                child: isBand
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Image.network(
                          capaPlaylist,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        child: Image.network(
                          capaPlaylist,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ComponentWidgetTextTopics(
                      text: namePlaylist,
                      fontSize: 14.5,
                      isBold: true,
                      paddingTop: 5,
                      paddingBottom: 5),
                  ComponentWidgetTextTopics(
                      text: descriptionPlaylist,
                      fontSize: 12.5,
                      isBold: false,
                      paddingTop: 5,
                      paddingBottom: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
