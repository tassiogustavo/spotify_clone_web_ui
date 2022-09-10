import 'package:flutter/material.dart';
import 'package:spotify_clone_web_ui/models/capa_playlist_model.dart';
import 'package:spotify_clone_web_ui/widgets/bottom_bar_player_widget.dart';
import 'package:spotify_clone_web_ui/widgets/components/component_top_navigation_buttons.dart';
import 'package:spotify_clone_web_ui/widgets/components/component_widget_card.dart';
import 'package:spotify_clone_web_ui/widgets/components/component_widget_playlist_item.dart';
import 'package:spotify_clone_web_ui/widgets/components/component_widget_text_topics.dart';
import 'package:spotify_clone_web_ui/widgets/drawer_menu_right_widget.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  int opacity = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          const DrawerMenuWidget(),
          Expanded(
            child: buildCatalogPage(width),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBarPlayerWidget(),
    );
  }

  Container buildCatalogPage(double width) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(218, 0, 0, 0),
            Color.fromARGB(235, 0, 0, 0),
          ],
        ),
      ),
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
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 57,
                    ),
                    const ComponentWidgetTextTopics(
                        text: "Boa tarde",
                        fontSize: 27,
                        isBold: true,
                        paddingTop: 15,
                        paddingBottom: 15),
                    buildPlaylistListGrid(width),
                    const ComponentWidgetTextTopics(
                      text: "Seus programas",
                      fontSize: 21,
                      isBold: true,
                      paddingTop: 15,
                      paddingBottom: 15,
                    ),
                    builderListProgramas(),
                    Row(
                      children: const [
                        ComponentWidgetTextTopics(
                          text: "Playlists generos",
                          fontSize: 21,
                          isBold: true,
                          paddingTop: 15,
                          paddingBottom: 15,
                        ),
                        Spacer(),
                        ComponentWidgetTextTopics(
                          text: "VER TUDO",
                          fontSize: 11,
                          isBold: false,
                          paddingTop: 30,
                          paddingBottom: 30,
                        ),
                      ],
                    ),
                    builderPlaylistGeneros(),
                    Row(
                      children: const [
                        ComponentWidgetTextTopics(
                          text: "Tocados recentemente",
                          fontSize: 21,
                          isBold: true,
                          paddingTop: 15,
                          paddingBottom: 15,
                        ),
                        Spacer(),
                        ComponentWidgetTextTopics(
                          text: "VER TUDO",
                          fontSize: 11,
                          isBold: false,
                          paddingTop: 30,
                          paddingBottom: 30,
                        ),
                      ],
                    ),
                    builderPlaylistTocadoRecentemente(),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ComponentTopNavigationButtons(opacity: opacity),
        ],
      ),
    );
  }

  SizedBox builderPlaylistTocadoRecentemente() {
    return SizedBox(
      height: 235,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false,physics: const ScrollPhysics()),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          controller: ScrollController(),
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                ComponentWidgetCard(
                    namePlaylist: capaBanda[index].name,
                    descriptionPlaylist: capaBanda[index].description,
                    capaPlaylist: capaBanda[index].capa,
                    isBand: true),
                const SizedBox(
                  width: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox builderPlaylistGeneros() {
    return SizedBox(
      height: 235,
      child: ScrollConfiguration(
         behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false,physics: const ScrollPhysics()),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          controller: ScrollController(),
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                ComponentWidgetCard(
                  namePlaylist: capaPlaylistModel[index].name,
                  descriptionPlaylist: capaPlaylistModel[index].description,
                  capaPlaylist: capaPlaylistModel[index].capa,
                  isBand: false,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Wrap buildPlaylistListGrid(double width) {
    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      spacing: 20.0,
      runSpacing: 15.0,
      children: [
        ComponentWidgetPlaylistItem(
          widthtPage: width,
          namePlaylist: capaPlaylistModel[0].name,
          capaPlaylist: capaPlaylistModel[0].capa,
          descriptionPlaylist: capaPlaylistModel[0].description,
        ),
        ComponentWidgetPlaylistItem(
          widthtPage: width,
          namePlaylist: capaBanda[0].name,
          capaPlaylist: capaBanda[0].capa,
          descriptionPlaylist: capaBanda[0].description,
        ),
        ComponentWidgetPlaylistItem(
          widthtPage: width,
          namePlaylist: capaPlaylistModel[2].name,
          capaPlaylist: capaPlaylistModel[2].capa,
          descriptionPlaylist: capaPlaylistModel[2].description,
        ),
        ComponentWidgetPlaylistItem(
          widthtPage: width,
          namePlaylist: capaBanda[2].name,
          capaPlaylist: capaBanda[2].capa,
          descriptionPlaylist: capaBanda[2].description,
        ),
        ComponentWidgetPlaylistItem(
          widthtPage: width,
          namePlaylist: capaPlaylistModel[5].name,
          capaPlaylist: capaPlaylistModel[5].capa,
          descriptionPlaylist: capaPlaylistModel[5].description,
        ),
        ComponentWidgetPlaylistItem(
          widthtPage: width,
          namePlaylist: capaBanda[5].name,
          capaPlaylist: capaBanda[5].capa,
          descriptionPlaylist: capaBanda[5].description,
        ),
      ],
    );
  }

  SizedBox builderListProgramas() {
    return SizedBox(
      height: 235,
      child: ScrollConfiguration(
         behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false,physics: const ScrollPhysics()),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          controller: ScrollController(),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                ComponentWidgetCard(
                  namePlaylist: capaProgramas[index].name,
                  descriptionPlaylist: capaProgramas[index].description,
                  capaPlaylist: capaProgramas[index].capa,
                  isBand: false,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
