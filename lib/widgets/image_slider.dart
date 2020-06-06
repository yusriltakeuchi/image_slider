import 'dart:async';

import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  List<String> imageList;
  double height;
  EdgeInsetsGeometry margin;
  double radius;
  AlignmentGeometry dotPosition;
  Color dotColor;

  ImageSlider({
    @required this.imageList,
    this.height = 180,
    @required this.margin,
    this.radius = 10,
    this.dotPosition = Alignment.bottomCenter,
    this.dotColor = Colors.white
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  PageController controller;
  int currentIndex = 0;

  void incrementCurrent(int position) {
    setState(() {
      if (currentIndex <= widget.imageList.length-2) {
        currentIndex = position;
      } else {
        currentIndex = 0;
      }
    });
  }

  void onChange(int position) {
    incrementCurrent(position);
  }

  void initializeTimer() async {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentIndex <= widget.imageList.length-2) {
        controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        controller.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
    );
    initializeTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            physics: BouncingScrollPhysics(),
            itemCount: widget.imageList.length,
            onPageChanged:(position) => onChange(position),
            itemBuilder: (context, index) {

              var item = widget.imageList[index];
              return _imageItem(index, item);
            },
          ),

          Align(
            alignment: widget.dotPosition,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 25, right: 25, top: 10),
              child: _dotProgress(),
            )
          )
        ],
      )
    );
  }

  Widget _imageItem(int index, String item) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(widget.radius),
        image: DecorationImage(
          image: NetworkImage(
            widget.imageList[index]
          ),
          fit: BoxFit.cover
        )
      ),   
    );
  }

  Widget _dotProgress() {
    return Container(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.imageList.length,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          
          return _dotItem(index);
        },
      ),
    );
  }

  Widget _dotItem(int index) {
    return Container(
      height: 12,
      width: 12,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: widget.dotColor, width: 2),
        color: currentIndex == index ? widget.dotColor : Colors.transparent
      ),
    );
  }
}