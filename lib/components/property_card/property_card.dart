import 'package:flutter/material.dart';

import 'package:homzes_mobile/components/property_card/property_detail_container.dart';
import 'package:homzes_mobile/utils/color_coding/color_coding.dart';
import 'package:homzes_mobile/utils/extensions/color_extension.dart';

import '/services/property_data/image_file_service.dart';
import '../title_with_navigation.dart';

class PropertyCard extends StatefulWidget {
  final String image;
  final int? price;
  final int? beds;
  final int? bathroom;
  final double? width;
  final double? height;
  final bool isFavouriteInclude;
  final Widget? actionWidget;
  final String title;
  final double titleFontSize;
  final String? location;
  final double? titleWidth;
  const PropertyCard(
      {required this.image,
      this.price,
      this.beds,
      this.bathroom,
      this.height = 230,
      this.width,
      required this.isFavouriteInclude,
      this.actionWidget,
      required this.title,
      required this.titleFontSize,
      this.location,
      this.titleWidth,
      Key? key})
      : super(key: key);

  @override
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  late Future<String> _imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _imageUrl = loadImage(widget.image);
  }

  Future<String> loadImage(String imageUrl) async {
    try {
      String url = await FileService.fetchFile(imageUrl);
      setState(() {
        isLoading = false;
      });
      return url;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<String>(
          future: _imageUrl,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: widget.height,
                  width: widget.width,
                  child: Center(
                      child: CircularProgressIndicator(
                          color: cardtextColor.toColor())));
            } else if (snapshot.hasError) {
              return const Icon(Icons.error);
            } else if (snapshot.hasData) {
              return !isLoading
                  ? Container(
                      width: widget.width,
                      height: widget.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.isFavouriteInclude
                                  ? IconButton(
                                      onPressed: (() {}),
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: menuIconColor.toColor(),
                                      ))
                                  : Container(),
                              Row(
                                children: [
                                  widget.beds != null
                                      ? ProertyDetailContainer(
                                          text: '${widget.beds} Beds',
                                        )
                                      : Container(),
                                  widget.bathroom != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: ProertyDetailContainer(
                                            text: '${widget.bathroom} Bathroom',
                                          ),
                                        )
                                      : Container(),
                                  widget.price != null
                                      ? Expanded(
                                          child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: ProertyDetailContainer(
                                                text: '\$ ${widget.price}',
                                              )),
                                        )
                                      : Container(),
                                ],
                              )
                            ]),
                      ),
                    )
                  : Container();
            } else {
              return const Icon(Icons.error);
            }
          },
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TitleWidget(
              title: widget.title,
              titleWidth: widget.titleWidth,
              titleFontSize: widget.titleFontSize,
              titleFontWeight: FontWeight.w600,
              actionWidget: widget.actionWidget ?? Container(),
            )),
        widget.location != null
            ? Text(
                widget.location!,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: viewAllFontColor.toColor()),
              )
            : Container(),
      ],
    );
  }
}
