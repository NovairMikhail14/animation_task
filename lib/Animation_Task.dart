import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimationTask extends StatefulWidget {


  @override
  State<AnimationTask> createState() => _AnimationTaskState();


}

class _AnimationTaskState extends State<AnimationTask> with SingleTickerProviderStateMixin {
  double widthApps = 600;
  AnimationController? _animationController;
  Animation<double>? _animation ;

  @override
  void initState() {
    super.initState();
    _animationController= AnimationController(vsync: this,duration: Duration(seconds: 3))..forward();
    _animation = Tween(begin:-widthApps,end:0.0).animate(CurvedAnimation(parent: _animationController!, curve: Curves.linear));
    _animationController!.addListener(() {setState(() {
    }); });
  }

  @override
  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    widthApps = widthApp;

    setState(() {
      _animationController!.forward();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Task"),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 3),
            left: _animation!.value,
            child: Container(
              height: 250,
              width: widthApp,
              color: Colors.yellow,
              child: Image.network(fit: BoxFit.fill,"https://twincitiesmom.com/wp-content/uploads/2022/07/2-2.png"),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 6),
            curve: Curves.easeInOutCubic,
            left: _animation!.value,
            child: Container(
              height: 250,
              width: widthApp,
              child: Text("lorem ipsum dolor" ,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
              color: Colors.green.withOpacity(0.2),
            ),
          ),
          AnimatedPositioned(
            top: 250,
            duration: Duration(seconds:8),
            curve: Curves.easeInOutCubic,
            left: _animation!.value,
            child: Container(
              height: 250,
              child: Text(" Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum " ,style: TextStyle(fontSize: 15,),),
              width: widthApp,
            ),
          ),
        ],


      ),
    );
  }
}
