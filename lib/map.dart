import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    final LatLng googleHQ = LatLng(37.4220, -122.0841);

    return Scaffold(
      backgroundColor: con.colorBack,

      //appbar
      appBar: AppBar(
        backgroundColor: con.colorCont,
        elevation: 0,
        title: Text(
          "Google Offices",
          style: TextStyle(color: Colors.white,),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Home(),
              ),
              );
            },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Container(
          decoration: BoxDecoration(
            color: con.colorCont,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(10),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: FlutterMap(
              options: MapOptions(
                initialCenter: googleHQ,
                initialZoom: 16,
              ),

              children: [
                TileLayer(
                  urlTemplate:
                    "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.proyecto',
                ),

                MarkerLayer(
                  markers: [
                    Marker(
                      point: googleHQ,
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
