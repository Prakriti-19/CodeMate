import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(33, 57, 89, 1),
      child: Center(
        child: SpinKitChasingDots(color: Colors.white,size: 40.0,),
      ),
    );
  }
}