import 'package:flutter/material.dart';

class ComponentTopNavigationButtons extends StatelessWidget {
  const ComponentTopNavigationButtons({
    Key? key,
    required this.opacity,
  }) : super(key: key);

  final int opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57,
      color: Color.fromARGB(opacity, 31, 31, 31),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: (){},
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 30,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Row(
              children: const  [
                SizedBox(
                  width: 2,
                ),
                SizedBox(
                  width: 25,
                  height: 25,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/pt/4/4a/TheKillersDirectHits.jpg",
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Tassio Gustavo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white,
                  size: 22,
                ),
                SizedBox(
                  width: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}