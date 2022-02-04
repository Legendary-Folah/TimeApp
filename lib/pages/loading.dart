// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWordTime() async {
    WorldTime instance =
        WorldTime(location: 'Lagos', flag: 'Nigeria.png', url: 'Africa/Lagos');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWordTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[600],
        body: Center(
          child: SpinKitThreeInOut(
            color: Colors.white,
            size: 60.0,
          ),
        ));
  }
}
