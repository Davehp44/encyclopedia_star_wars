import 'package:encyclopedia_star_wars/constants/stringValues.dart';
import 'package:encyclopedia_star_wars/models/vehicle_model.dart';
import 'package:flutter/material.dart';

class VehicleDetailsWidget extends StatelessWidget {
  final VehiclesModel vehiclesModel;

  const VehicleDetailsWidget({required this.vehiclesModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(details),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Hero(
                      tag: '${vehiclesModel.name} img',
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(width: 1, color: Colors.blue)),
                          child: const Icon(
                            Icons.car_crash,
                            size: 100,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text(vehiclesModel.name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text('Manufacturer: ${vehiclesModel.manufacturer}',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text('Model: ${vehiclesModel.model}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text(
                        'Cost In Credits: ${vehiclesModel.costInCredits}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text('Length: ${vehiclesModel.length}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text(
                        'Max Atmosphering Speed: ${vehiclesModel.maxAtmospheringSpeed}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text('Crew: ${vehiclesModel.crew}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text('Passengers: ${vehiclesModel.passengers}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text(
                        'Cargo Capacity: ${vehiclesModel.cargoCapacity}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text('Consumables: ${vehiclesModel.consumables}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text('Vehicle Class: ${vehiclesModel.vehicleClass}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            )));
  }
}
