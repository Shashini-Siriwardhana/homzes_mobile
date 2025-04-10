import 'package:flutter/material.dart';

import 'package:homzes_mobile/screens/catalog_3.dart';
import 'package:homzes_mobile/utils/extensions/color_extension.dart';

import '../components/menu_icon.dart';
import '../components/profile_icon.dart';
import '../components/property_card/property_card.dart';
import '../components/search_bar/search_field.dart';
import '../components/title_with_navigation.dart';
import '../services/property_data/fetch_all_properties_service.dart';
import '../utils/color_coding/color_coding.dart';
import '../utils/responsive/screen_sizes.dart';

class Catalog1Screen extends StatefulWidget {
  const Catalog1Screen({Key? key}) : super(key: key);

  @override
  State<Catalog1Screen> createState() => _Catalog1ScreenState();
}

class _Catalog1ScreenState extends State<Catalog1Screen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProperties();
  }

  Future<void> loadProperties() async {
    try {
      await fetchProperties();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Firebase initialization failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = displayHeight(context);
    double screenWidth = displayWidth(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: buyCardColor.toColor(),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.02),
                      child: AppBar(
                        automaticallyImplyLeading: false,
                        leading: MenuIcon(
                          backgroundColor: transparentColor,
                          iconColor: cardtextColor,
                          borderColor: transparentColor,
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Hi, Stanislav',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.0,
                                    color: cardtextColor.toColor()),
                              ),
                            ),
                          ],
                        ),
                        centerTitle: false,
                        backgroundColor: Colors.transparent,
                        actions: [
                          ProfileIcon(
                            user: 'S',
                            statusColor: inactiveStatusColor,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.01,
                          bottom: screenHeight * 0.03,
                          right: screenWidth * 0.02,
                          left: screenWidth * 0.02),
                      child: SearchField(
                        data: properties
                            .map((item) => item['title'].toString())
                            .toList(),
                        onSearch: (p0) => {},
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.only(
                          right: screenWidth * 0.02,
                          left: screenWidth * 0.02,
                          top: screenHeight * 0.02),
                      child: Column(
                        children: [
                          TitleWidget(
                            title: 'Featured',
                            titleFontSize: 18,
                            titleFontWeight: FontWeight.w700,
                            actionWidget: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Catalog3Screen()),
                                );
                              },
                              child: Text(
                                'View all',
                                style: TextStyle(
                                    color: viewAllFontColor.toColor(),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          !isLoading
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: properties.map((property) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: PropertyCard(
                                          width: 150,
                                          titleWidth: 150,
                                          height: 150,
                                          price: property['price'],
                                          image: property['image'],
                                          isFavouriteInclude: false,
                                          title: property['title'],
                                          titleFontSize: 14,
                                        ),
                                      );
                                    }).toList(),
                                  ))
                              : Center(
                                  child: CircularProgressIndicator(
                                  color: cardtextColor.toColor(),
                                )),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                        right: screenWidth * 0.02,
                        left: screenWidth * 0.02,
                        top: screenHeight * 0.02,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: screenHeight * 0.03),
                            child: TitleWidget(
                              title: 'New offers',
                              titleFontSize: 18,
                              titleFontWeight: FontWeight.w700,
                              actionWidget: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Catalog3Screen()),
                                  );
                                },
                                child: Text(
                                  'View all',
                                  style: TextStyle(
                                      color: viewAllFontColor.toColor(),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          !isLoading
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      bottom: screenHeight * 0.03),
                                  child: PropertyCard(
                                    price: properties[0]['price'],
                                    image: properties[0]['image'],
                                    isFavouriteInclude: true,
                                    title: properties[0]['title'],
                                    titleFontSize: 16,
                                    actionWidget: Row(
                                      children: [
                                        Icon(
                                          Icons.star_outline,
                                          color: createAccountButtonColor
                                              .toColor(),
                                        ),
                                        Text(
                                          '4.9',
                                          style: TextStyle(
                                              color: cardtextColor.toColor(),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '(29 Reviews)',
                                          style: TextStyle(
                                              color: viewAllFontColor.toColor(),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                      color: cardtextColor.toColor())),
                        ],
                      )),
                ]),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
