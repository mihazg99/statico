import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:statico/screens/citizen/controllers/AddCaseController.dart';

class SearchBox extends StatelessWidget {

  final controller = AddCaseController.to;
  @override
  Widget build(BuildContext context) {
      return InkWell(onTap: ()=>getPrediction(context),
        child: Obx(
          ()=> Container(
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                getIcon(controller.address.value),
                SizedBox(
                  width: 15,
                ),
                Center(
                  child: Text(controller.address.value,textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0),),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width - 25,
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
        ),
      );
    }

  Future<Null> getPrediction(context) async{
    Prediction? p = await PlacesAutocomplete.show(
      hint: "Traži",
        offset: 0,
        radius: 1000,
        types: [],
        strictbounds: false,
        region: "hr",
        context: context,
        apiKey: controller.apiKey,
        mode: Mode.overlay, // Mode.fullscreen
        language: "hr",
        components: [new Component(Component.country, "hr")]);

    controller.displayPrediction(p);

  }

  getIcon(searchText){
    if(searchText == "Pronađite svoju adresu"){
      return Icon(Icons.search);
    }else{
      return Icon(Icons.check,color: Colors.green,);
    }
  }

}
