import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  final String appTitle;

  const HomeScreen({
    super.key,
    required this.appTitle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResultList = [];
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    log('initState', name: 'HomeScreen');

    initBle();
    // scanBle();
  }

  void initBle() {
    log('initBle() entry', name: 'initBle');
    flutterBlue.isScanning.listen((isScanning) {
      log('_isScanning: $_isScanning => $isScanning', name: 'initBle');
      _isScanning = isScanning;
      setState(() {});
    });
  }

  void scanBle() {
    // log('scanBle() entry', name: 'scanBle');

    // flutterBlue.startScan(timeout: const Duration(seconds: 4));

    // var subscription = flutterBlue.scanResults.listen((results) {
    //   for (ScanResult r in results) {
    //     log('${r.device.name}: rssi: ${r.rssi}', name: 'bt cat');
    //   }
    // });

    // flutterBlue.stopScan();
  }

  /* 
  scan start / stop
  */
  scan() async {
    if (!_isScanning) {
      scanResultList.clear();

      flutterBlue.startScan(timeout: const Duration(seconds: 4));

      flutterBlue.scanResults.listen((results) {
        scanResultList = results;

        setState(() {});
      });
    } else {
      flutterBlue.stopScan();
    }

    // _isScanning = !(_isScanning);
    // log('_isScanning: $_isScanning => ${!_isScanning}',
    //     name: 'HomeScreen.scan');
    // setState(() {});
  }

  /*
  output function for per device
  */
  Widget deviceSignal(ScanResult r) {
    return Text(r.rssi.toString());
  }

  Widget deviceMacAddress(ScanResult r) {
    return Text(r.device.id.id);
  }

  Widget deviceName(ScanResult r) {
    String name = '';

    if (r.device.name.isNotEmpty) {
      // device.name is set
      name = r.device.name;
    } else if (r.advertisementData.localName.isNotEmpty) {
      // device advertisementData localName is set
      name = r.advertisementData.localName;
    } else {
      // fuck
      name = 'N/A';
    }

    return Text(name);
  }

  Widget leading(ScanResult r) {
    return const CircleAvatar(
      backgroundColor: Colors.cyan,
      child: Icon(
        Icons.bluetooth,
        color: Colors.white,
      ),
    );
  }

  void onTap(ScanResult r) {
    log('device name you tapped: ${r.device.name}');
  }

  Widget listItem(ScanResult r) {
    return ListTile(
      // title: const Text('placeholder'),
      onTap: () => onTap(r),
      leading: leading(r),
      title: deviceName(r),
      subtitle: deviceMacAddress(r),
      trailing: deviceSignal(r),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: ListView.separated(
          itemCount: scanResultList.length,
          itemBuilder: (context, index) {
            return listItem(scanResultList[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        child: Icon(_isScanning ? Icons.stop : Icons.search),
      ),
    );
  }
}
