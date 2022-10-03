import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_api/pages/world_time.dart';

class Loading extends StatefulWidget {
   const Loading({Key? key}) : super(key: key);

  @override
   _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Lisbon');
    await instance.setTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images3.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: SpinKitSpinningLines(
            color: Color.fromARGB(255, 175, 173, 170),
            size: 100.0,
          )),
        )
      ],
    ));
  }
}
