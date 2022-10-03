import 'package:flutter/material.dart';

import 'package:world_time_api/pages/world_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: 'India', flag: 'india.png', url: 'Etc/GMT+5'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Hong Kong', flag: 'Hong_Kong.png', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Melbourne', flag: 'Aust.png', url: 'Australia/Melbourne' ),
    WorldTime(location: 'Sydney', flag: 'Aust.png', url: 'Australia/Sydney' ),
    WorldTime(location: 'Berlin', flag: 'berlin.png', url: 'Europe/Berlin' ),
    WorldTime(location: 'Athens', flag: 'germany.png', url: 'Europe/Berlin' ),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo' ),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi' ),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago' ),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesian.png', url: 'Asia/Jakarta' ),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.setTime();
  
     Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('edit Location'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images3.png'),
              fit: BoxFit.fill
            )
          ) ,
        ),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: () {
                    updateTime(index);


                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('images/flags/${locations[index].flag}'),
                  )),
            );
          }),
    );
  }
}
