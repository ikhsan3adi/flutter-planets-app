import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_planets_app/data_dummy/dummy_planets.dart';
import 'package:my_planets_app/data_model/planet.dart';
import 'package:my_planets_app/main.dart';
import 'package:my_planets_app/pages/planet_detail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

Widget myIconButton({
  required VoidCallback onPressed,
  required Widget icon,
  required String tooltip,
}) {
  return IconButton(
    onPressed: onPressed,
    icon: icon,
    tooltip: tooltip,
  );
}

// Favourite Button
class FavBtn extends StatefulWidget {
  const FavBtn({super.key, required this.planetIndex});

  final int planetIndex;

  @override
  State<FavBtn> createState() => _FavBtnState();
}

class _FavBtnState extends State<FavBtn> {
  @override
  Widget build(BuildContext context) {
    return myIconButton(
        onPressed: () {
          setState(() {
            myPlanets[widget.planetIndex].isFavourite = !myPlanets[widget.planetIndex].isFavourite;

            if (myPlanets[widget.planetIndex].isFavourite) {
              myPreferences.setBool('Fav: ${myPlanets[widget.planetIndex].id.toString()}', myPlanets[widget.planetIndex].isFavourite);

              Fluttertoast.showToast(msg: 'Favoritkan ${myPlanets[widget.planetIndex].name}');
            } else {
              myPreferences.remove('Fav: ${myPlanets[widget.planetIndex].id.toString()}');
            }
          });
        },
        icon: Icon(myPlanets[widget.planetIndex].isFavourite ? Icons.star : Icons.star_border_outlined,
            color: myPlanets[widget.planetIndex].isFavourite ? Colors.tealAccent : null),
        tooltip: 'Favorit');
  }
}

// Share Button
class ShareBtn extends StatefulWidget {
  const ShareBtn({super.key, required this.planet});

  final Planet planet;

  @override
  State<ShareBtn> createState() => _ShareBtnState();
}

class _ShareBtnState extends State<ShareBtn> {
  @override
  Widget build(BuildContext context) {
    return myIconButton(
        onPressed: () async {
          final asset = await rootBundle.load(widget.planet.image);
          final bytes = asset.buffer.asUint8List();

          final tempDir = await getTemporaryDirectory();
          final file = await File('${tempDir.path}/image.jpg').create();

          file.writeAsBytesSync(bytes);

          Share.shareFiles([file.path], text: shareText);
        },
        icon: const Icon(Icons.share),
        tooltip: 'Bagikan');
  }
}
