import 'package:flutter/material.dart';

import 'package:homzes_mobile/components/buttons/navigation_button.dart';
import 'package:homzes_mobile/utils/extensions/color_extension.dart';

import '../components/card/icon_card.dart';
import '../components/menu_icon.dart';
import '../utils/color_coding/color_coding.dart';
import '../utils/responsive/screen_sizes.dart';
import 'catalog_1.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = displayHeight(context);
    double screenWidth = displayWidth(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/welcome_screen/house image 1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(170),
            ),
          ),
          SizedBox(
            height: screenHeight,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.02),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Homzes',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                          color: menuIconColor.toColor()),
                    ),
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                    actions: [
                      MenuIcon(
                        backgroundColor: transparentColor,
                        iconColor: menuIconColor,
                        borderColor: menuIconColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Find the best place for you',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: menuIconColor.toColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              fontFamily: 'Roboto Flex',
                              letterSpacing: -0.02 * 36),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.06, bottom: screenHeight * 0.02),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconCard(
                              name: 'Rent',
                              icon: 'assets/icons/rent.svg',
                              backgroundColor: rentCardColor),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: IconCard(
                                name: 'Buy',
                                icon: 'assets/icons/buy.svg',
                                backgroundColor: buyCardColor),
                          ),
                          IconCard(
                              name: 'Sale',
                              icon: '',
                              backgroundColor: saleCardColor),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth * 0.02,
                      left: screenWidth * 0.02,
                      bottom: 30),
                  child: NavigationButton(
                      width: screenWidth,
                      name: 'Create an account',
                      fontSize: 16,
                      backgroundColor: createAccountButtonColor,
                      borderRadius: 24,
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Catalog1Screen()))
                          }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
