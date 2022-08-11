import 'package:encyclopedia_star_wars/constants/constants.dart';
import 'package:encyclopedia_star_wars/models/planet_model.dart';
import 'package:encyclopedia_star_wars/screen_widgets/planet_details_widget.dart';
import 'package:flutter/material.dart';

class PlanetWidget extends StatefulWidget {
  const PlanetWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StatePlanetWidget();
  }
}

class StatePlanetWidget extends State<PlanetWidget> {
  List<PlanetModel> listCharacterModel = [];
  ValueNotifier<int> next = ValueNotifier(0);
  ValueNotifier<int> previous = ValueNotifier(0);
  int totalPlanet = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await dbHelper.countPlanets(totalPlanet).then((value) async {
        if (value > 0) {
          totalPlanet = value;
          await dbHelper.getPlanets(valorFactor, 0).then((value) {
            next.value += valorFactor;
            listCharacterModel.clear;
            listCharacterModel.addAll(value);
          });
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ListView.builder(
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white.withOpacity(0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                          tag: '${listCharacterModel[index].name} img',
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border:
                                      Border.all(width: 1, color: Colors.blue)),
                              child: const Icon(
                                Icons.language,
                                size: 60,
                                color: Colors.blue,
                              ),
                            ),
                          )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 15, top: 2),
                            child: Text(
                                'Name: ${listCharacterModel[index].name}',
                                overflow: TextOverflow.ellipsis),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 25, top: 2),
                            child: Text(
                              'Terrain: ${listCharacterModel[index].terrain}',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanetDetailsWidget(
                          planetModel: listCharacterModel[index]),
                    )),
              ),
            ),
            itemCount: listCharacterModel.length,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: previous,
                builder: (context, value, child) => IconButton(
                    onPressed: () async {
                      if (previous.value >= valorFactor) {
                        await dbHelper
                            .getPlanets(
                                valorFactor, previous.value - valorFactor)
                            .then((value) {
                          next.value -= valorFactor;
                          previous.value -= valorFactor;
                          listCharacterModel.clear();
                          listCharacterModel.addAll(value);
                          setState(() {});
                        });
                      }
                    },
                    icon: previous.value >= valorFactor
                        ? const Icon(
                            Icons.arrow_circle_up,
                            color: Colors.blue,
                          )
                        : const Icon(
                            Icons.arrow_circle_up,
                            color: Colors.grey,
                          )),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
                width: 5,
                height: 5,
                margin: const EdgeInsets.only(bottom: 5),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
                width: 5,
                height: 5,
                margin: const EdgeInsets.only(top: 5),
              ),
              ValueListenableBuilder(
                valueListenable: next,
                builder: (context, value, child) => IconButton(
                    onPressed: () async {
                      if (previous.value + valorFactor < totalPlanet) {
                        await dbHelper
                            .getPlanets(valorFactor, next.value)
                            .then((value) {
                          next.value += valorFactor;
                          previous.value += valorFactor;
                          listCharacterModel.clear();
                          listCharacterModel.addAll(value);
                          setState(() {});
                        });
                      }
                    },
                    icon: previous.value + valorFactor < totalPlanet
                        ? const Icon(
                            Icons.arrow_circle_down,
                            color: Colors.blue,
                          )
                        : const Icon(
                            Icons.arrow_circle_down,
                            color: Colors.grey,
                          )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
