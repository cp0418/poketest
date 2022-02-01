import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_exam_pokedex/widgets/appbar.dart';

class BluetoothListScreen extends StatefulWidget {
  BluetoothListScreen({Key? key}) : super(key: key);

  @override
  State<BluetoothListScreen> createState() => _BluetoothListScreenState();
}

class _BluetoothListScreenState extends State<BluetoothListScreen> {
  late final BluetoothState? state;

  var resultsList;
  @override
  void initState() {
    super.initState();
    _bluetoothScan();
  }

  _bluetoothScan() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    flutterBlue.startScan(timeout: Duration(seconds: 4));
// Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) async {
      // do something with scan results

      for (ScanResult r in results) {
        print('${r.device.id} ${r.device.name} found! rssi: ${r.rssi}');
        if (r.device.id == "E6883D56-0BB6-01C3-73BB-80E4BBFEC6EA") {
          await r.device.connect();
          print("Connected");
        }
      }
    });

    flutterBlue.stopScan();
  }

// Stop scanning
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(appBarTitle: 'Bluetooth'),
      ),
    );
  }
}
