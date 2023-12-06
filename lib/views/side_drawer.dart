import 'package:flutter/material.dart';
import 'package:giantslayer/controller/all_in_controller.dart';
import 'package:giantslayer/theme/common_theme.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AllInController provider = Provider.of(context, listen: false);
    return Container(
      color: CommonTheme.appBackgroundColor,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              provider.getSubscribePlan(context);
            },
            title: Text(
              'Subscribe to Premium',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/payment_detail_screen');
            },
            title: Text(
              'Payment Detail Screen',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/choose_your_interest');
            },
            title: Text(
              'Choose Your Interest',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/play_screen');
            },
            title: Text(
              'Play Screen',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                '/place_add_screen_bottom_navigation',
              );
            },
            title: Text(
              'Place Add Screen',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                '/list_of_played_new_ads_screen',
              );
            },
            title: Text(
              'List of Played Ads/New ads',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.pop(context);
              provider.getGenreDataList(context);
            },
            title: Text(
              'Streamer',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
