import 'package:flutter/material.dart';
import 'package:image_slider/widgets/image_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Image Slider",
          style: TextStyle(color: Colors.black87)
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          )
        ],
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  List<String> imageList = [
    "https://images.unsplash.com/photo-1519834089823-08a494ba5a12?ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
    "https://images.unsplash.com/photo-1586254571367-fa6c2aec21d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=854&q=80",
    "https://images.unsplash.com/photo-1579829713864-f9222ef5c73f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1591039182914-277fc1c895a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80",
    "https://images.unsplash.com/photo-1551518157-eeb214ad83cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ImageSlider(
            imageList: imageList,
            margin: EdgeInsets.all(0),
            radius: 0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  "Informasi",
                  style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 10),
                ImageSlider(
                  imageList: imageList,
                  margin: EdgeInsets.only(right: 10),
                  dotPosition: Alignment.bottomRight,
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}