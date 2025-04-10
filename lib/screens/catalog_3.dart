import 'package:flutter/material.dart';

import 'package:homzes_mobile/utils/extensions/color_extension.dart';

import '../components/menu_icon.dart';
import '../components/property_card/property_card.dart';
import '../components/search_bar/search_field.dart';
import '../services/property_data/fetch_all_properties_service.dart';
import '../utils/color_coding/color_coding.dart';
import '../utils/responsive/screen_sizes.dart';

class Catalog3Screen extends StatefulWidget {
  const Catalog3Screen({Key? key}) : super(key: key);

  @override
  State<Catalog3Screen> createState() => _Catalog3ScreenState();
}

class _Catalog3ScreenState extends State<Catalog3Screen> {
  bool isLoading = false;
  List<dynamic> _filteredProperties = [];

  @override
  void initState() {
    super.initState();
    _filteredProperties = properties;
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProperties = properties;
      } else {
        _filteredProperties = properties
            .where((item) =>
                item['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> getProperties() async {
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
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: saleCardColor.toColor(),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.03),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    leading: MenuIcon(
                      backgroundColor: cardtextColor,
                      iconColor: menuIconColor,
                      borderColor: transparentColor,
                    ),
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.09,
                      bottom: screenHeight * 0.03,
                      right: screenWidth * 0.02,
                      left: 70),
                  child: SearchField(
                    data: properties
                        .map((item) => item['title'].toString())
                        .toList(),
                    onSearch: _handleSearch,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Popular rent offers',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: cardtextColor.toColor()),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
              ),
              child: !isLoading
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          children: _filteredProperties.map((property) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                          child: PropertyCard(
                            beds: property['no_of_beds'],
                            bathroom: property['no_of_bathrooms'],
                            image: property['image'],
                            isFavouriteInclude: true,
                            title: property['title'],
                            titleFontSize: 16,
                            actionWidget: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$ ${property['price']}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: cardtextColor.toColor()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 4),
                                  child: Text(
                                    '/ mo',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: cardtextColor.toColor()),
                                  ),
                                )
                              ],
                            ),
                            location: property['location'],
                          ),
                        );
                      }).toList()),
                    )
                  : Text('Loading...'),
            ),
          )
        ]),
      ),
    ));
  }
}
