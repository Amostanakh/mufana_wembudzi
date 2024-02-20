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
