import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:straycare_app/DEMO/controller/location_controller.dart';
import 'package:straycare_app/DEMO/viewMap/forMap.dart';
class LocationExample extends StatelessWidget {
  const LocationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LocationController>(
      init: LocationController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Get Current Location'),
          ),
          body: Center(
            child: controller.isLoading.value ? Center(
                child: CircularProgressIndicator()) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    onTap: (){
                      MapUtils.openMap(controller.currentPosition!.latitude, controller.currentPosition!.longitude);
                    },

                    child: Text(
                      controller.currentLocation == null ? 'No Location Found' :
                      controller.currentLocation!, style: TextStyle(fontSize: 23),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    controller.getCurrentLocation();
                  },
                  child: Text('Get Current Location'),
                )
              ],
            ),
          ),


        );
      }
    );
  }
}
