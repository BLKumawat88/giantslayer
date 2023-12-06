import 'package:flutter/material.dart';
import 'package:giantslayer/model/search_model.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchHintText = GoogleFonts.urbanist(
    fontSize: 16,
    color: Color(0xFF767676),
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );
  final choiceText = GoogleFonts.urbanist(
    fontSize: 14,
    color: Color(0xFF767676),
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF212121),
        title: TextFormField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 28),
            filled: true,
            fillColor: Color(0xFF191919),
            hintText: 'Search for Live TV, Movies, TV shows?',
            hintStyle: searchHintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFF191919),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xFF191919),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              searchModel.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/error.png'),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Not Found',
                          style: TextStyle(
                            color: CommonTheme.buttonColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sorry, the keyword you entered could not be '
                          'found try to check again or serach with other keyword',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : Wrap(
                      children: [
                        ...searchModel.map(
                          (e) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                top: 20,
                              ),
                              child: ChoiceChip(
                                labelPadding: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 10,
                                  right: 10,
                                ),
                                side:
                                    BorderSide(color: CommonTheme.buttonColor),
                                disabledColor: Colors.black,
                                label: Text(e.title),
                                labelStyle: choiceText,
                                selected: false,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
