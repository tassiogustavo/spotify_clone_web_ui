import 'package:flutter/material.dart';
import 'package:spotify_clone_web_ui/widgets/bottom_bar_player_widget.dart';
import 'package:spotify_clone_web_ui/widgets/drawer_menu_right_widget.dart';

import '../widgets/components/component_top_navigation_buttons.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({
    Key? key,
    required this.namePlaylist,
    required this.capaPlaylist,
    required this.descriptionPlaylist,
  }) : super(key: key);

  final String namePlaylist;
  final String capaPlaylist;
  final String descriptionPlaylist;

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  int opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Row(
          children: [
            const DrawerMenuWidget(),
            Expanded(child: buildPlaylistPage()),
          ],
        ),
        bottomNavigationBar: const BottomBarPlayerWidget(),
      ),
    );
  }

  Container buildPlaylistPage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 63, 14, 17),
      child: Stack(
        children: [
          NotificationListener(
            onNotification: (ScrollNotification scrollNotification) {
              if ((scrollNotification.metrics.pixels * 0.9) <= 254) {
                opacity = (scrollNotification.metrics.pixels * 0.9).toInt();
              } else {
                opacity = 254;
              }
              setState(() {});
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  builderHeaderTop(),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.12],
                        colors: <Color>[
                          Color.fromARGB(255, 63, 14, 17),
                          Color.fromARGB(255, 18, 18, 18),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        builderStartPlaylistArea(),
                        const SizedBox(
                          height: 25,
                        ),
                        buildColumnNames(),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.2,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                          itemCount: 15,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                builderRowSong(
                                  (index + 1).toString(),
                                  widget.capaPlaylist,
                                  'Nome da música - Tema principal',
                                  'Artista compositor',
                                  'Álbum principal',
                                  '17 de dez. de 2020',
                                  '5:04',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ComponentTopNavigationButtons(opacity: opacity),
        ],
      ),
    );
  }

  Widget builderRowSong(String id, String capaImg, String nameSong,
      String artist, String album, String dateAdd, String duration) {
    return Row(children: [
      Expanded(
        flex: 5,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                id,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Container(
                width: 35,
                height: 35,
                color: Colors.red,
                child: Image.network(
                  capaImg,fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameSong,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      artist,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        flex: 3,
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      album,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      dateAdd,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        flex: 0,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(right: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    duration,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Row buildColumnNames() {
    return Row(children: [
      Expanded(
        flex: 5,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    '#',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w200,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'TÍTULO',
                    style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.white70,
                      fontWeight: FontWeight.w200,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'ÁLBUM',
                    style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.white70,
                      fontWeight: FontWeight.w200,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'ADICIONADO EM',
                    style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.white70,
                      fontWeight: FontWeight.w200,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 0,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(right: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.white60,
                    size: 19,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Row builderStartPlaylistArea() {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: const Icon(
            Icons.play_arrow_rounded,
            size: 33,
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        const Icon(
          Icons.favorite_outline_sharp,
          size: 33,
          color: Colors.white70,
        ),
        const SizedBox(
          width: 22,
        ),
        const Icon(
          Icons.keyboard_control_outlined,
          size: 33,
          color: Colors.white70,
        ),
      ],
    );
  }

  Container builderHeaderTop() {
    return Container(
      width: double.infinity,
      height: 308,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(255, 161, 37, 45),
            Color.fromARGB(255, 74, 16, 20),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 208,
                height: 208,
                margin: const EdgeInsets.only(left: 25),
                color: Colors.blue,
                child:  Image.network(
                  widget.capaPlaylist,fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  builderTextHeader(
                    'PLAYLIST',
                    13,
                    FontWeight.bold,
                  ),
                  builderTextHeader(
                    widget.namePlaylist,
                    54,
                    FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  builderTextHeader(
                    widget.descriptionPlaylist,
                    12,
                    FontWeight.normal,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      builderTextHeader(
                        '${widget.descriptionPlaylist} • 24.504 curtidas • 38 músicas,',
                        12,
                        FontWeight.bold,
                      ),
                      builderTextHeader(
                        ' 1h 31min',
                        12,
                        FontWeight.normal,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget builderTextHeader(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
