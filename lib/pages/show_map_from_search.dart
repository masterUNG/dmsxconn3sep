// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:psinsx/models/dmsx_model.dart';
import 'package:psinsx/models/search_dmsx_model.dart';

class ShowMapFromSearch extends StatefulWidget {
  final SearchDmsxModel searchDmsxModel;
  final bool? showMobile;

  const ShowMapFromSearch({
    Key? key,
    required this.searchDmsxModel,
    this.showMobile,
  }) : super(key: key);

  @override
  State<ShowMapFromSearch> createState() => _ShowMapFromSearchState();
}

class _ShowMapFromSearchState extends State<ShowMapFromSearch> {
  SearchDmsxModel? searDmsxmodel;

  
  LatLng? latLng;

  @override
  void initState() {
    super.initState();
    searDmsxmodel = widget.searchDmsxModel;

    

    if (widget.showMobile ?? false) {
      //แสดงแผนที่ latMobile, lngMobile
      latLng = LatLng(double.parse(searDmsxmodel!.latMobile), double.parse(searDmsxmodel!.lngMobile));
    } else {
      //แสดงแผนที่ lat, lng
      latLng = LatLng(double.parse(searDmsxmodel!.lat), double.parse(searDmsxmodel!.lng));
    }

    






  }

  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId('id'),
        position: latLng!,
        infoWindow: InfoWindow(
            title: searDmsxmodel!.cus_name, snippet: searDmsxmodel!.status_txt),
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searDmsxmodel!.cus_name!),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: latLng!,
                zoom: 16),
            markers: myMarker(),
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }
}
