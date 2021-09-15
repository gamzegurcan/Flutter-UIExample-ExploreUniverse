import 'dart:ui';

import 'package:explore_universe/core/constants/color_constants.dart';
import 'package:explore_universe/features/model/universe_model_locale.dart';
import 'package:flutter/material.dart';
import 'package:explore_universe/core/extensions/context_extensions.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.highValue * 4),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        SizedBox(
                          height: context.highValue * 0.5,
                        ),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: contentTextColor,
                          ),
                        ),
                        SizedBox(
                          height: context.highValue * 0.5,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: contentTextColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 32.0),
                    height: context.highValue * 2.3,
                    child: ListView.builder(
                        itemCount: planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                planetInfo.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            Positioned(
              right: -64,
              child: Hero(
                child: Image.asset(planetInfo.iconImage),
                tag: planetInfo.position,
              ),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  fontWeight: FontWeight.w900,
                  color: primaryTextColor.withOpacity(0.08),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
