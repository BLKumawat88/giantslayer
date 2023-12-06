import 'package:flutter/material.dart';

class ShowPopupAndPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Image Popup example')),
        backgroundColor: Colors.grey[800],
        body: CircleAvatar(
            child: GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context, builder: (_) => ImageDialog());
              },
            ),
            radius: 50.0,
            //Photo by Tamas Tuzes-Katai on Unsplash
            backgroundImage: NetworkImage(
                'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320')));
  }
}

class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        // width: MediaQuery.of(context).size.width / 3,
        width: 330,
        height: 330,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "You have not any active plan. Buy plan and Enjoy without ads",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(
                "http://192.168.29.172/giant-slayer/backend/public/uploads/streamers/video/45/16691949821312.png",
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFB91D)),
                      onPressed: () {},
                      child: Text('Without Ads'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFB91D)),
                      onPressed: () {},
                      child: Text('With Ads'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
