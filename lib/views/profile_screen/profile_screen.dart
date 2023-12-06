import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/theme/common_button.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void logout() {
    bottomSheet();
  }

  final tileText = GoogleFonts.urbanist(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  final textLogout = GoogleFonts.urbanist(
    fontSize: 22,
    color: CommonTheme.buttonColor,
    fontWeight: FontWeight.w700,
  );

  final subtextLogout = GoogleFonts.urbanist(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  void bottomSheet() {
    showModalBottomSheet(
      backgroundColor: Color(0xFF1F222A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
            color: Color(0xFF1F222A),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0xFF35383F),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Logout',
                style: textLogout,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 1,
                color: Color(0xFF35383F),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Are you sure you want to log out?',
                style: subtextLogout,
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: Color(0xFF35383F),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Cancel',
                            style: CommonTheme.commonAuthButtonText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: CommonTheme.buttonColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Yes, Logout',
                            style: CommonTheme.commonAuthButtonText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AllInController provider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: CommonTheme.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: CommonTheme.appbarTitle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CommonTheme.buttonColor,
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/girl.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'James',
                style: GoogleFonts.urbanist(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/edit_profile');
              },
              leading: Image.asset(
                'assets/images/users.png',
                width: 23,
              ),
              title: Text(
                'Edit Profile',
                style: tileText,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 17,
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/notification.png',
                width: 23,
              ),
              title: Text(
                'Notification',
                style: tileText,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 17,
              ),
            ),
            ListTile(
              onTap: () {
                provider.getFaqList(context);
              },
              leading: Image.asset(
                'assets/images/info.png',
                width: 23,
              ),
              title: Text(
                'Faq',
                style: tileText,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 17,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonButton(
                      color: CommonTheme.buttonColor,
                      text: 'Logout',
                      type: 'common',
                      textColor: Colors.white,
                      methodName: logout,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
