import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:animations/animations.dart';
import 'package:http/http.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? jsonSample;
  Position? position;

  Future<void> getJsonSample() async {
    String output = '';
    var response =
        await get(Uri.https('api.github.com', '/users/hadley/orgs'));

    if (response.statusCode == 200) {
      var body = response.body;
      setState(() {
        jsonSample = jsonDecode(body).toString();
      });
    }
  }

  Future<void> getGeo() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var output = await Geolocator.getCurrentPosition();

    setState(() {
      position = output;
    });
  }

  @override
  void initState() {
    super.initState();
    getJsonSample();
    getGeo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('geo: $position'),
            Text('cut json: ${jsonSample?.substring(0, 48)}'),
          ],
        ),
      ),
    );
  }
}
