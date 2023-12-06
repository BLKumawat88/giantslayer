import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});
  final title = GoogleFonts.urbanist(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
  final subtitle = GoogleFonts.urbanist(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    AllInController provider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonTheme.appBackgroundColor,
        title: Text(
          'FAQ',
          style: CommonTheme.appbarTitle,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ...provider.faqList
                  .map(
                    (e) => Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF1F222A),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ExpansionTile(
                          backgroundColor: Color(0xFF1F222A),
                          title: Text(
                            e['question'],
                            style: title,
                          ),
                          childrenPadding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 14,
                          ),
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.trailing,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e['answer'],
                                style: subtitle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
