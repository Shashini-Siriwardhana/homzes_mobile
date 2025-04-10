import 'package:flutter/material.dart';

import 'package:homzes_mobile/utils/color_coding/color_coding.dart';
import 'package:homzes_mobile/utils/extensions/color_extension.dart';

import '/utils/responsive/screen_sizes.dart';

class SearchField extends StatefulWidget {
  final List<String> data;
  final Function(String) onSearch;

  const SearchField({Key? key, required this.data, required this.onSearch})
      : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  List<String> _filteredData = [];
  bool openSuggetions = true;

  @override
  void initState() {
    super.initState();
    _filteredData = widget.data;
  }

  void _onSearchChanged(String query) {
    widget.onSearch(query); // Notify parent of search change
    setState(() {
      if (query.isEmpty) {
        _filteredData = widget.data;
        openSuggetions = true;
      } else {
        _filteredData = widget.data
            .where((suggestion) =>
                suggestion.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = displayWidth(context);
    return Stack(
      children: [
        TextField(
          controller: _controller,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(-1.0, 1.0),
              child: const Icon(Icons.search),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: menuIconColor.toColor(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          ),
        ),
        const SizedBox(height: 10),
        _controller.text.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: menuIconColor.toColor(),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: _filteredData.isNotEmpty && openSuggetions
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: _filteredData.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_filteredData[index]),
                              onTap: () {
                                _controller.text = _filteredData[index];
                                widget.onSearch(_filteredData[index]);
                                setState(() {
                                  openSuggetions = false;
                                });
                                FocusScope.of(context).unfocus();
                              },
                            );
                          },
                        )
                      : _filteredData.isEmpty && openSuggetions
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'No properties found',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          : Container(),
                ),
              )
            : Container(),
      ],
    );
  }
}
