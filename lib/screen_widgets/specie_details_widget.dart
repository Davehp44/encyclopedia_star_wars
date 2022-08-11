import 'package:encyclopedia_star_wars/constants/stringValues.dart';
import 'package:encyclopedia_star_wars/models/specie_model.dart';
import 'package:flutter/material.dart';

class SpecieDetailsWidget extends StatelessWidget {
  final SpecieModel specieModel;

  const SpecieDetailsWidget({required this.specieModel, Key? key})
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
                      tag: '${specieModel.name} img',
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
                            Icons.adb,
                            size: 100,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 15, top: 2),
                    child: Text(specieModel.name,
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
                    child: Text('Classification: ${specieModel.classification}',
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
                    child: Text('Designation: ${specieModel.designation}',
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
                    child: Text('Average Height: ${specieModel.averageHeight}',
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
                    child: Text('Hair Colors: ${specieModel.hairColors}',
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
                    child: Text('Skin Colors: ${specieModel.skinColors}',
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
                    child: Text('Eye Colors: ${specieModel.eyeColors}',
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
                        'Average Lifespan: ${specieModel.averageLifespan}',
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
                    child: Text('Language: ${specieModel.language}',
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
