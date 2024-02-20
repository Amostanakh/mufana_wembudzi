// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geoflutterfire2/geoflutterfire2.dart';
// // import 'package:rxdart/rxdart.dart';

// // class Test extends StatefulWidget {
// //   @override
// //   _TestState createState() => _TestState();
// // }

// // class _TestState extends State<Test> {
// //   GoogleMapController? _mapController;
// //   TextEditingController? _latitudeController, _longitudeController;

// //   // firestore init
// //   final _firestore = FirebaseFirestore.instance;
// //   GeoFlutterFire? geo;
// //   Stream<List<DocumentSnapshot>>? stream;
// //   final radius = BehaviorSubject<double>.seeded(1.0);
// //   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

// //   @override
// //   void initState() {
// //     super.initState();
// //     _latitudeController = TextEditingController();
// //     _longitudeController = TextEditingController();

// //     geo = GeoFlutterFire();
// //     GeoFirePoint center = geo!.point(latitude: 12.960632, longitude: 77.641603);
// //     stream = radius.switchMap((rad) {
// //       var collectionReference = _firestore.collection('locations');
// // //          .where('name', isEqualTo: 'darshan');
// //       return geo!.collection(collectionRef: collectionReference).within(
// //           center: center, radius: rad, field: 'position', strictMode: true);

// //       /*
// //       ****Example to specify nested object****

// //       var collectionReference = _firestore.collection('nestedLocations');
// // //          .where('name', isEqualTo: 'darshan');
// //       return geo.collection(collectionRef: collectionReference).within(
// //           center: center, radius: rad, field: 'address.location.position');

// //       */
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _latitudeController!.dispose();
// //     _longitudeController!.dispose();
// //     radius.close();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final mediaQuery = MediaQuery.of(context);
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('GeoFlutterFire'),
// //         actions: <Widget>[
// //           // IconButton(
// //           //   onPressed: _mapController == null
// //           //       ? null
// //           //       : () {
// //           //           _showHome();
// //           //         },
// //           //   icon: Icon(Icons.home),
// //           // )
// //         ],
// //       ),
// //       body: Container(
// //         child: ListView(
// //           // crossAxisAlignment: CrossAxisAlignment.center,
// //           children: <Widget>[
// //             Center(
// //               child: Card(
// //                 elevation: 4,
// //                 margin: EdgeInsets.symmetric(vertical: 8),
// //                 child: SizedBox(
// //                   width: mediaQuery.size.width - 30,
// //                   height: mediaQuery.size.height * (1),
// //                   child: GoogleMap(
// //                     onMapCreated: _onMapCreated,
// //                     initialCameraPosition: const CameraPosition(
// //                       target: LatLng(12.960632, 77.641603),
// //                       zoom: 15.0,
// //                     ),
// //                     markers: Set<Marker>.of(markers.values),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(top: 8.0),
// //               child: Slider(
// //                 min: 1,
// //                 max: 200,
// //                 divisions: 4,
// //                 value: _value,
// //                 label: _label,
// //                 activeColor: Colors.black,
// //                 inactiveColor: Colors.black.withOpacity(0.2),
// //                 onChanged: (double value) => changed(value),
// //               ),
// //             ),
// //             // Row(
// //             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             //   children: <Widget>[
// //             //     Container(
// //             //       width: 100,
// //             //       child: TextField(
// //             //         controller: _latitudeController,
// //             //         keyboardType: TextInputType.number,
// //             //         textInputAction: TextInputAction.next,
// //             //         decoration: InputDecoration(
// //             //             labelText: 'lat',
// //             //             border: OutlineInputBorder(
// //             //               borderRadius: BorderRadius.circular(8),
// //             //             )),
// //             //       ),
// //             //     ),
// //                 // Container(
// //                 //   width: 100,
// //                 //   child: TextField(
// //                 //     controller: _longitudeController,
// //                 //     keyboardType: TextInputType.number,
// //                 //     decoration: InputDecoration(
// //                 //         labelText: 'lng',
// //                 //         border: OutlineInputBorder(
// //                 //           borderRadius: BorderRadius.circular(8),
// //                 //         )),
// //                 //   ),
// //                 // ),
// //                 // MaterialButton(
// //                 //   color: Colors.blue,
// //                 //   onPressed: () {
// //                 //     final lat = double.parse(_latitudeController!.text);
// //                 //     final lng = double.parse(_longitudeController!.text);
// //                 //     _addPoint(lat, lng);
// //                 //   },
// //                 //   child: const Text(
// //                 //     'ADD',
// //                 //     style: TextStyle(color: Colors.white),
// //                 //   ),
// //                 // )
// //             //   ],
// //             // ),
// //             // MaterialButton(
// //             //   color: Colors.amber,
// //             //   child: const Text(
// //             //     'Add nested ',
// //             //     style: TextStyle(color: Colors.white),
// //             //   ),
// //             //   onPressed: () {
// //             //     final lat = double.parse(_latitudeController!.text);
// //             //     final lng = double.parse(_longitudeController!.text);
// //             //     _addNestedPoint(lat, lng);
// //             //   },
// //             // )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _onMapCreated(GoogleMapController controller) {
// //     setState(() {
// //       _mapController = controller;
// // //      _showHome();
// //       //start listening after map is created
// //       stream!.listen((List<DocumentSnapshot> documentList) {
// //         _updateMarkers(documentList);
// //       });
// //     });
// //   }

// //   void _showHome() {
// //     _mapController!.animateCamera(CameraUpdate.newCameraPosition(
// //       const CameraPosition(
// //         target: LatLng(12.960632, 77.641603),
// //         zoom: 15.0,
// //       ),
// //     ));
// //   }

// //   void _addPoint(double lat, double lng) {
// //     GeoFirePoint geoFirePoint = geo!.point(latitude: lat, longitude: lng);
// //     _firestore
// //         .collection('locations')
// //         .add({'name': 'random name', 'position': geoFirePoint.data}).then((_) {
// //       print('added ${geoFirePoint.hash} successfully');
// //     });
// //   }

// //   //example to add geoFirePoint inside nested object
// //   void _addNestedPoint(double lat, double lng) {
// //     GeoFirePoint geoFirePoint = geo!.point(latitude: lat, longitude: lng);
// //     _firestore.collection('nestedLocations').add({
// //       'name': 'random name',
// //       'address': {
// //         'location': {'position': geoFirePoint.data}
// //       }
// //     }).then((_) {
// //       print('added ${geoFirePoint.hash} successfully');
// //     });
// //   }

// //   void _addMarker(double lat, double lng) {
// //     final id = MarkerId(lat.toString() + lng.toString());
// //     final _marker = Marker(
// //       markerId: id,
// //       position: LatLng(lat, lng),
// //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
// //       infoWindow: InfoWindow(title: 'latLng', snippet: '$lat,$lng'),
// //     );
// //     setState(() {
// //       markers[id] = _marker;
// //     });
// //   }

// //   void _updateMarkers(List<DocumentSnapshot> documentList) {
// //     documentList.forEach((DocumentSnapshot document) {
// //       Map<String, dynamic>? snapData = document.data() as Map<String, dynamic>?;
// //       final GeoPoint point = snapData!['position']['geopoint'];
// //       _addMarker(point.latitude, point.longitude);
// //     });
// //   }

// //   double _value = 20.0;
// //   String _label = '';

// //   changed(value) {
// //     setState(() {
// //       _value = value;
// //       _label = '${_value.toInt().toString()} kms';
// //       markers.clear();
// //     });
// //     radius.add(value);
// //   }
// // }
// // const CameraPosition(target: LatLng(-19.0169211, 29.1528018), zoom: 7);
// import 'dart:async';
// import 'package:flutter/material.dart';
// // import 'package:livestock_sms/widgets/inputs.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({
// //     super.key,
// //   });

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   String locationMessage = "Error occored";

// //   @override
// //   Widget build(BuildContext context) {
// //     Set<Marker> getNarkers() {
// //       return <Marker>{
// //         const Marker(
// //             markerId: MarkerId("livestock"),
// //             position: LatLng(
// //               -17.784,
// //               31.053,
// //             ),
// //             icon: BitmapDescriptor.defaultMarker,
// //             infoWindow: InfoWindow(title: 'livestock'))
// //       };
// //     }

// //     CameraPosition initialPosition =
// //         const CameraPosition(target: LatLng(-19.0169211, 29.1528018), zoom: 7);
// //     Completer<GoogleMapController> _controller = Completer();

// //     void onMapCreated(GoogleMapController controller) {
// //       _controller.complete(controller);
// //     }

// //     MapType currentMapType = MapType.normal;

// //     void onMapTypeButtonPressed() {
// //       setState(() {
// //         currentMapType = currentMapType == MapType.normal
// //             ? MapType.satellite
// //             : MapType.normal;
// //       });
// //     }

// //     //
// //     //
// //     //
// //     //yuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuer

// //     return Scaffold(
// //       drawer: const AdminDrawer(),
// //       appBar: AppBar(
// //         title: const Text('Location'),
// //       ),
// //       body: Stack(
// //         children: <Widget>[
// //           GoogleMap(
// //             markers: getNarkers(),
// //             // markers: Set<Marker>.of(markers.values),
// //             onMapCreated: onMapCreated,
// //             initialCameraPosition: initialPosition,
// //             zoomControlsEnabled: true,
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(14.0),
// //             child: Align(
// //               alignment: Alignment.topRight,
// //               child: FloatingActionButton.extended(
// //                 onPressed: () {
// //                   // determinePosition();
// //                 },
// //                 materialTapTargetSize: MaterialTapTargetSize.padded,
// //                 backgroundColor: Colors.orange,
// //                 label: const Text("Get Location"),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
// import 'package:livestock_sms/widgets/inputs.dart';
// import 'package:rxdart/rxdart.dart';

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   GoogleMapController? _mapController;
//   TextEditingController? _latitudeController, _longitudeController;

//   // firestore init
//   final _firestore = FirebaseFirestore.instance;
//   GeoFlutterFire? geo;
//   Stream<List<DocumentSnapshot>>? stream;
//   final radius = BehaviorSubject<double>.seeded(1.0);
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

//   @override
//   void initState() {
//     super.initState();
//     _latitudeController = TextEditingController();
//     _longitudeController = TextEditingController();

//     geo = GeoFlutterFire();
//     GeoFirePoint center = geo!.point(latitude: 12.960632, longitude: 77.641603);
//     stream = radius.switchMap((rad) {
//       var collectionReference = _firestore.collection('locations');
//       return geo!.collection(collectionRef: collectionReference).within(
//           center: center, radius: rad, field: 'position', strictMode: true);
//     });
//   }

//   @override
//   void dispose() {
//     _latitudeController!.dispose();
//     _longitudeController!.dispose();
//     radius.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Livestock'),
//         actions: <Widget>[
//           // IconButton(
//           //   onPressed: _mapController == null
//           //       ? null
//           //       : () {
//           //           _showHome();
//           //         },
//           //   icon: Icon(Icons.home),
//           // )
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(12),
//         children: <Widget>[
//           TextField(
//             controller: _latitudeController,
//             keyboardType: TextInputType.number,
//             textInputAction: TextInputAction.next,
//             decoration: InputDecoration(
//                 labelText: 'latitude',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(0),
//                 )),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           TextField(
//             controller: _longitudeController,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//                 labelText: 'longitude',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(0),
//                 )),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           MaterialButton(
//             color: Colors.orange,
//             onPressed: () {
//               final lat = double.parse(_latitudeController!.text);
//               final lng = double.parse(_longitudeController!.text);
//               _addPoint(lat, lng);
//             },
//             child: const Text(
//               'ADD',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           MaterialButton(
//             color: Colors.amber,
//             child: const Text(
//               'Add nested ',
//               style: TextStyle(color: Colors.white),
//             ),
//             onPressed: () {
//               final lat = double.parse(_latitudeController!.text);
//               final lng = double.parse(_longitudeController!.text);
//               _addNestedPoint(lat, lng);
//             },
//           )
//         ],
//       ),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _mapController = controller;
// //      _showHome();
//       //start listening after map is created
//       stream!.listen((List<DocumentSnapshot> documentList) {
//         _updateMarkers(documentList);
//       });
//     });
//   }

//   void _showHome() {
//     _mapController!.animateCamera(CameraUpdate.newCameraPosition(
//       const CameraPosition(
//         target: LatLng(12.960632, 77.641603),
//         zoom: 15.0,
//       ),
//     ));
//   }

//   void _addPoint(double lat, double lng) {
//     GeoFirePoint geoFirePoint = geo!.point(latitude: lat, longitude: lng);
//     _firestore
//         .collection('locations')
//         .add({'name': 'random name', 'position': geoFirePoint.data}).then((_) {
//       print('added ${geoFirePoint.hash} successfully');
//     });
//   }

//   //example to add geoFirePoint inside nested object
//   void _addNestedPoint(double lat, double lng) {
//     GeoFirePoint geoFirePoint = geo!.point(latitude: lat, longitude: lng);
//     _firestore.collection('nestedLocations').add({
//       'name': 'random name',
//       'address': {
//         'location': {'position': geoFirePoint.data}
//       }
//     }).then((_) {
//       print('added ${geoFirePoint.hash} successfully');
//     });
//   }

//   void _addMarker(double lat, double lng) {
//     final id = MarkerId(lat.toString() + lng.toString());
//     final _marker = Marker(
//       markerId: id,
//       position: LatLng(lat, lng),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//       infoWindow: InfoWindow(title: 'latLng', snippet: '$lat,$lng'),
//     );
//     setState(() {
//       markers[id] = _marker;
//     });
//   }

//   void _updateMarkers(List<DocumentSnapshot> documentList) {
//     documentList.forEach((DocumentSnapshot document) {
//       Map<String, dynamic>? snapData = document.data() as Map<String, dynamic>?;
//       final GeoPoint point = snapData!['position']['geopoint'];
//       _addMarker(point.latitude, point.longitude);
//     });
//   }

//   double _value = 20.0;
//   String _label = '';

//   changed(value) {
//     setState(() {
//       _value = value;
//       _label = '${_value.toInt().toString()} kms';
//       markers.clear();
//     });
//     radius.add(value);
//   }
// }
