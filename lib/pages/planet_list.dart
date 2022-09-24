import 'package:flutter/material.dart';
import 'package:my_planets_app/data_dummy/dummy_planets.dart';
import 'package:my_planets_app/pages/about.dart';
import 'package:my_planets_app/widget_template/drawer.dart';
import 'package:my_planets_app/pages/planet_detail.dart';
import 'package:my_planets_app/widget_template/icon_button.dart';
import 'package:my_planets_app/widget_template/style_text.dart';

class PlanetListHomePage extends StatelessWidget {
  const PlanetListHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPlanetsApp'),
      ),
      body: RefreshIndicator(onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 1000));
        return Future(() {});
      }, child: LayoutBuilder(
        builder: (ctx, constraints) {
          if (constraints.maxWidth > 900) {
            return CardGridView(ctx: context, gridCrossAxisCount: 6);
          } else if (constraints.maxWidth > 600) {
            return CardGridView(ctx: context, gridCrossAxisCount: 4);
          } else {
            return MobileListView(ctx: context);
          }
        },
      )),
      drawer: Drawer(
        child: SafeArea(
          child: Material(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                const Image(
                  image: AssetImage('assets/images/logo-02.png'),
                ),
                const Divider(),
                mxBuildMenuItem(
                  icon: Icons.person,
                  titleText: 'About',
                  onClicked: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const About()),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileListView extends StatefulWidget {
  const MobileListView({super.key, required this.ctx});

  final BuildContext ctx;

  @override
  State<MobileListView> createState() => MobileListViewState();
}

class MobileListViewState extends State<MobileListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: myPlanets.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal,
                      backgroundImage: AssetImage(myPlanets[index].image),
                    ),
                    title: Text(myPlanets[index].name),
                    subtitle: Text(
                      myPlanets[index].description,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: FavBtn(planetIndex: index),
                    onTap: () {
                      var route = MaterialPageRoute(builder: (context) => PlanetDetail(planet: myPlanets[index], planetIndex: index));

                      // refresh page pertama saat kembali dari page ke-2
                      Navigator.push(widget.ctx, route).then((_) => setState(() {}));
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CardGridView extends StatefulWidget {
  const CardGridView({super.key, required this.ctx, required this.gridCrossAxisCount});

  final BuildContext ctx;
  final int gridCrossAxisCount;

  @override
  State<CardGridView> createState() => CardGridViewState();
}

class CardGridViewState extends State<CardGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Flexible(
            child: GridView.count(
              childAspectRatio: 0.75,
              crossAxisCount: widget.gridCrossAxisCount,
              children: List.generate(myPlanets.length, (index) {
                return InkWell(
                  onTap: () {
                    var route = MaterialPageRoute(builder: (context) => PlanetDetail(planet: myPlanets[index], planetIndex: index));

                    // refresh page pertama saat kembali dari page ke-2
                    Navigator.push(widget.ctx, route).then((_) => setState(() {}));
                  },
                  child: Card(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: AssetImage(myPlanets[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: FavBtn(planetIndex: myPlanets[index].id),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ListTile(
                            isThreeLine: true,
                            title: myBoldText(text: myPlanets[index].name, textAlign: TextAlign.start, withBackground: true),
                            subtitle: Text(
                              myPlanets[index].description,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(backgroundColor: Colors.black38),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
