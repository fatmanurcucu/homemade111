
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AddNewEat extends StatefulWidget {
   AddNewEat({Key? key}) : super(key: key);

  @override
  State<AddNewEat> createState() => _AddNewEatState();
}

class _AddNewEatState extends State<AddNewEat> {
  final _picker = ImagePicker();
  File? image;
  var latitud;
  var longitud;
  var altitud;
  var adrees;
  var location ="";
  void grtCurrentLocation()async{
    var position = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState((){
      location="${position.latitude} ,${position.longitude}";
    });
  }
  Future<void>updatePosition()async{
    Position pos = await detrminePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState((){
      latitud = pos.latitude.toString();
      longitud = pos.longitude.toString();
      altitud = pos.altitude.toString();
      adrees = pm[0].toString();
      location="${latitud} ,${longitud}";
    });

    print(adrees);
  }

  Future<Position>detrminePosition()async{
    bool ServerEnebaled;
    LocationPermission permission;
    ServerEnebaled = await Geolocator.isLocationServiceEnabled();
    if(!ServerEnebaled) return Future.error("error");
    permission= await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission==LocationPermission.denied)return Future.error("error");
    }
    if(permission==LocationPermission.deniedForever)return Future.error("error");

    return await Geolocator.getCurrentPosition();
  }
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];String dropdownvalue2 = 'Item 1';
  var items2 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];String dropdownvalue3 = 'Item 1';
  var items3 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  uploadImage()async{
    var peckid=await _picker.getImage(source: ImageSource.camera);
    if(peckid!=null) {
      setState((){
        image = File(peckid.path);
      });
    }else{
      image=null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Eat"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  child: Center(
                    child:image==null? Text("Image Add"):
                    Image.file(image!),
                  ),
                ),
                onTap: (){
                    uploadImage();

                },
              ),
              SizedBox(height: 10,),
              // 1. Drop
              Container(
                child: DropdownButton(

                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),

              ),
              // 2. Drop
              Container(
                child: DropdownButton(

                  // Initial Value
                  value: dropdownvalue2,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items2.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue2 = newValue!;
                    });
                  },
                ),

              ),
              // 3. Drop
              Container(
                child: DropdownButton(

                  // Initial Value
                  value: dropdownvalue3,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items3.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue3 = newValue!;
                    });
                  },
                ),

              ),
              
              
              Container(
                child: Text(location),
              ),

              MaterialButton(onPressed: ()async{
               await updatePosition();
              },child: Text("press"),)

            ],
          ),
        ),
      ),
    );
  }
}



