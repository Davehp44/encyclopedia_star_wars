import 'package:encyclopedia_star_wars/constants/stringValues.dart';
import 'package:encyclopedia_star_wars/models/starship_model.dart';
import 'package:flutter/material.dart';

class StarShipDetailsWidget extends StatelessWidget {
  final StarshipsModel starshipsModel;

  const StarShipDetailsWidget({required this.starshipsModel, Key? key})
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
                      tag: '${starshipsModel.name} img',
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
                            Icons.airplanemode_active,
                            size: 100,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text(starshipsModel.name,
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
                    child: Text('Manufacturer: ${starshipsModel.manufacturer}',
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
                    child: Text('Model: ${starshipsModel.model}',
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
                        'Cost In Credits: ${starshipsModel.costInCredits}',
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
                    child: Text('Length: ${starshipsModel.length}',
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
                        'Max Atmosphering Speed: ${starshipsModel.maxAtmospheringSpeed}',
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
                    child: Text('Crew: ${starshipsModel.crew}',
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
                    child: Text('Passengers: ${starshipsModel.passengers}',
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
                        'Cargo Capacity: ${starshipsModel.cargoCapacity}',
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
                    child: Text('Consumables: ${starshipsModel.consumables}',
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
                        'Starship Class: ${starshipsModel.starshipClass}',
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
