import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_planets_app/widget_template/style_text.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: LayoutBuilder(builder: (context, con) {
        return Center(
            child: SingleChildScrollView(
          child: Container(
            width: con.maxWidth,
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image(
                  width: clampDouble(con.maxHeight, 0, 1200),
                  image: const AssetImage('assets/images/logo-02.png'),
                ),
              ),
              myBoldText(text: 'Tentang', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              const Text('MyPlanetsApp by Ikhsan S'),
              const SizedBox(height: 32)
            ]),
          ),
        ));
      }),
    );
  }
}
