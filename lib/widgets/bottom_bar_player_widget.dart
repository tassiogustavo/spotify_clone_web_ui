import "package:flutter/material.dart";

class BottomBarPlayerWidget extends StatelessWidget {
  const BottomBarPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(225, 0, 0, 0),
      height: 82,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widgetLeftSongCapa(),
            const Spacer(),
            widgetCenterPlayerControl(width),
            const Spacer(),
            widgetRighSideIcons(width),
          ],
        ),
      ),
    );
  }

  Row widgetLeftSongCapa() {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: Image.network(
            "https://upload.wikimedia.org/wikipedia/pt/4/4a/TheKillersDirectHits.jpg",
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "I Want To Break Free",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.5,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Queen",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 9,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.favorite_outline,
          color: Colors.white70,
          size: 17,
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.picture_in_picture_alt,
          color: Colors.white70,
          size: 17,
        ),
      ],
    );
  }

  Column widgetCenterPlayerControl(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 220,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.shuffle,
                color: Colors.green,
                size: 20,
              ),
              Icon(
                Icons.skip_previous,
                color: Colors.white70,
              ),
              Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 35,
              ),
              Icon(
                Icons.skip_next,
                color: Colors.white70,
              ),
              Icon(
                Icons.repeat,
                color: Colors.white70,
                size: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: width * .4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '1:55',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 9,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              SizedBox(
                width: width * .3,
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Colors.white,
                  value: 0.7,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              const Text(
                '2:35',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget widgetRighSideIcons(double width) {
    return width >= 800
        ? SizedBox(
            width: 225,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.mic_external_on_outlined,
                  color: Colors.white70,
                  size: 17,
                ),
                Icon(
                  Icons.line_weight_sharp,
                  color: Colors.white70,
                  size: 17,
                ),
                Icon(
                  Icons.devices_other,
                  color: Colors.white70,
                  size: 17,
                ),
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.white70,
                  size: 17,
                ),
                SizedBox(
                  width: 80,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.white,
                    value: 0.7,
                  ),
                ),
                Icon(
                  Icons.open_in_full,
                  color: Colors.white70,
                  size: 17,
                ),
              ],
            ),
          )
        : const Icon(
            Icons.open_in_full,
            color: Colors.white70,
            size: 17,
          );
  }
}
