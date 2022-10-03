import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Map data = {};

  @override
  Widget build(BuildContext context) {

    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings?.arguments as Map;
    }

    
    return Scaffold(
        body: Stack(
          
          fit: StackFit.expand,
          children: [
            
            Container(
              
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/home_img1.png'),
                 fit: BoxFit.cover)),
        child: Padding(
            padding: EdgeInsets.fromLTRB(65.0, 180.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                Text(
                   data['time'],
                  style: TextStyle(
                      fontSize: 60.0, color: Color.fromARGB(255, 33, 30, 30)),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                      fontSize: 24.0,
                      letterSpacing: 3.0,
                      color: Color.fromARGB(255, 34, 30, 30)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context,'/location');
                        setState(() {
                          data = {
                            'time' : result['time'],
                            'location': result['location'],
                            //'isDaytime': result['isDaytime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                  
                 
                  icon: Icon(Icons.edit_location),
                  label: Text('edit location'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 144, 163, 239)   ,
                      foregroundColor: Color.fromARGB(255, 47, 42, 48),
                      textStyle: TextStyle(fontSize: 20)),
                      
                  
                )
              ],
            )),
      ),
          ],
        )
    );
  }
}
