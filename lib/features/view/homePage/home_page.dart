import 'dart:ui';

import 'package:explore_universe/core/constants/app_constants.dart';
import 'package:explore_universe/core/constants/color_constants.dart';
import 'package:explore_universe/core/extensions/context_extensions.dart';
import 'package:explore_universe/features/model/universe_model_locale.dart';
import 'package:explore_universe/features/view/detailPage/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appconstants = AppConstants();
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: context.paddingMedium,
                //const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton<dynamic>(
                      items: [
                        DropdownMenuItem<dynamic>(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 24,
                              color: const Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: context.paddingNormal,
                        //EdgeInsets.only(left: 16),
                        child: Image(
                            image:
                                AssetImage('assets/images/drop_down_icon.png')),
                      ),
                      underline: SizedBox(),
                    )
                  ],
                ),
              ),
              Container(
                height: context.highValue * 6,
                padding: EdgeInsets.only(left: context.mediumValue),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: context.width - 2 * 64,
                  itemHeight: context.height - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 15,
                      space: 5,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: context.highValue * 1.5),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: context.paddingMedium,
                                  //const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: context.highValue * 1.1,
                                      ),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 40,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Solar System',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 23,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: context.normalValue,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Know More',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: context.paddingMedium,
                            child: Hero(
                              tag: planets[index].position,
                              child: Image.asset(planets[index].iconImage),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: context.paddingLow,
        //const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(appconstants.menuIconImage),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(appconstants.searchIconImage),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(appconstants.profileIconImage),
            ),
          ],
        ),
      ),
    );
  }
}
