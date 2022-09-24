import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_planets_app/data_model/planet.dart';
import 'package:my_planets_app/widget_template/icon_button.dart';
import 'package:my_planets_app/widget_template/style_text.dart';

String shareText = '';

class PlanetDetail extends StatelessWidget {
  const PlanetDetail({
    Key? key,
    required this.planet,
    required this.planetIndex,
  }) : super(key: key);

  final Planet planet;

  final int planetIndex;

  @override
  Widget build(BuildContext context) {
    String liveable = planet.liveable ? 'Ya' : 'Tidak';

    shareText = '${planet.name}\n${planet.description}\nRotasi : ${planet.rotation}\nRevolusi : ${planet.revolution}\nBisa ditinggali? : $liveable';
    return LayoutBuilder(builder: (ctx, constraints) {
      if (constraints.maxWidth > 600) {
        return DesktopViewDetail(
          planet: planet,
          liveable: liveable,
          planetIndex: planetIndex,
        );
      } else {
        return MobileViewDetail(
          planet: planet,
          liveable: liveable,
          planetIndex: planetIndex,
        );
      }
    });
  }
}

class MobileViewDetail extends StatefulWidget {
  const MobileViewDetail({super.key, required this.planet, required this.liveable, required this.planetIndex});

  final Planet planet;
  final int planetIndex;

  final String liveable;
  @override
  State<MobileViewDetail> createState() => _MobileViewDetailState();
}

class _MobileViewDetailState extends State<MobileViewDetail> {
  double expandedSliverAppBarHeight = 540;

  var sliverAppBarScrollFactor = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: expandedSliverAppBarHeight,
            actions: [
              FavBtn(planetIndex: widget.planetIndex),
              ShareBtn(planet: widget.planet),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // mendapatkan nilai 0.0 - 1.0 dari space pada flexibleSpaceBar
                sliverAppBarScrollFactor = (constraints.biggest.height - (MediaQuery.of(context).padding.top + kToolbarHeight)) /
                    (expandedSliverAppBarHeight - kToolbarHeight);

                return Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Opacity(
                        opacity: lerpDouble(0.0, 1.0, clampDouble(sliverAppBarScrollFactor * 4, 0, 1))!,
                        child: Image(
                          image: AssetImage(widget.planet.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    FlexibleSpaceBar(
                      title: Text(
                        widget.planet.name,
                        // sliverAppBarScrollFactor.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      titlePadding: EdgeInsetsDirectional.only(
                        // ubah ukuran title padding agar tidak bertumupuk dengan back button
                        start: lerpDouble(72.0, 16.0, sliverAppBarScrollFactor)!,
                        bottom: lerpDouble(16.0, 40.0, clampDouble(sliverAppBarScrollFactor * 4, 0, 1))!,
                      ),
                    ),
                    Positioned(
                      bottom: -2,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color.lerp(Colors.transparent, Colors.grey[850], clampDouble(sliverAppBarScrollFactor * 4, 0, 1)),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                            child: Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color.lerp(Colors.transparent, Colors.grey[700], clampDouble(sliverAppBarScrollFactor * 4, 0, 1)),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                        )),
                      ),
                    ),
                  ],
                );
              },
            ),
            floating: true,
            pinned: true,
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                decoration: BoxDecoration(color: Colors.grey[850]),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            myHeading1Text(text: 'Deskripsi', textAlign: TextAlign.start),
                            Text(widget.planet.description),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Table(children: [
                                TableRow(
                                  children: [
                                    myBoldText(text: 'Rotasi', textAlign: TextAlign.start),
                                    Text(widget.planet.rotation),
                                  ],
                                ),
                                const TableRow(children: [SizedBox(height: 8), SizedBox(height: 8)]),
                                TableRow(
                                  children: [
                                    myBoldText(text: 'Revolusi', textAlign: TextAlign.start),
                                    Text(widget.planet.revolution),
                                  ],
                                ),
                                const TableRow(children: [SizedBox(height: 8), SizedBox(height: 8)]),
                                TableRow(
                                  children: [
                                    myBoldText(text: 'Memungkinkan adanya kehidupan', textAlign: TextAlign.start),
                                    Text(widget.liveable),
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: 1),
            itemExtent: MediaQuery.of(context).size.height,
          )
        ],
      ),
    );
  }
}

class DesktopViewDetail extends StatefulWidget {
  const DesktopViewDetail({
    super.key,
    required this.planet,
    required this.liveable,
    required this.planetIndex,
  });

  final Planet planet;
  final int planetIndex;

  final String liveable;

  @override
  State<DesktopViewDetail> createState() => _DesktopViewDetailState();
}

class _DesktopViewDetailState extends State<DesktopViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Center(
            child: Container(
              width: clampDouble(constraints.maxWidth, 100, constraints.maxHeight * 2 - 16),
              height: constraints.maxHeight - 16,
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: constraints.maxHeight,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.planet.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.horizontal(left: Radius.circular(10)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: myHeading1Text(text: widget.planet.name, textAlign: TextAlign.start),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                myHeading1Text(text: 'Deskripsi', textAlign: TextAlign.start),
                                Row(
                                  children: [
                                    FavBtn(planetIndex: widget.planetIndex),
                                    ShareBtn(planet: widget.planet),
                                  ],
                                ),
                              ],
                            ),
                            Text(widget.planet.description),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Table(children: [
                                TableRow(
                                  children: [
                                    myBoldText(text: 'Rotasi', textAlign: TextAlign.start),
                                    Text(widget.planet.rotation),
                                  ],
                                ),
                                const TableRow(children: [SizedBox(height: 8), SizedBox(height: 8)]),
                                TableRow(
                                  children: [
                                    myBoldText(text: 'Revolusi', textAlign: TextAlign.start),
                                    Text(widget.planet.revolution),
                                  ],
                                ),
                                const TableRow(children: [SizedBox(height: 8), SizedBox(height: 8)]),
                                TableRow(
                                  children: [
                                    myBoldText(text: 'Memungkinkan adanya kehidupan', textAlign: TextAlign.start),
                                    Text(widget.liveable),
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
