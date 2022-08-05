import 'dart:convert';

import 'package:encyclopedia_star_wars/models/character_model.dart';
import 'package:encyclopedia_star_wars/models/request_model.dart';
import 'package:encyclopedia_star_wars/screen_widgets/character_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CharactersWidget extends StatefulWidget {
  const CharactersWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateCharactersWidget();
  }
}

class StateCharactersWidget extends State<CharactersWidget> {
  late Future<RequestModel> futureCharacters;
  List<CharacterModel> listCharacterModel = [];
  ValueNotifier<String> next = ValueNotifier("");
  ValueNotifier<String> previous = ValueNotifier("");

  @override
  void initState() {
    super.initState();
    futureCharacters =
        fetchCharacterListRequestModel('https://swapi.dev/api/people/');
  }

  Future<RequestModel> fetchCharacterListRequestModel(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var characterListRequestModel =
          RequestModel.fromJson(jsonDecode(response.body));
      if (characterListRequestModel.next != null) {
        next.value = characterListRequestModel.next!;
      } else {
        next.value = "";
      }
      if (characterListRequestModel.previous != null) {
        previous.value = characterListRequestModel.previous!;
      } else {
        previous.value = "";
      }
      return characterListRequestModel;
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: FutureBuilder<RequestModel>(
            future: futureCharacters,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                listCharacterModel.clear();
                for (var element in snapshot.data!.results) {
                  listCharacterModel.add(CharacterModel.fromJson(element));
                }
                return ListView.builder(
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            width: 1, color: Colors.blue)),
                                    child: const Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )),
                            Column(
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
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 15, top: 2),
                                  child: Text(
                                      'Birth Year: ${listCharacterModel[index].birthYear}',
                                      overflow: TextOverflow.ellipsis),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterDetailsWidget(
                                characterModel: listCharacterModel[index]),
                          )),
                    ),
                  ),
                  itemCount: listCharacterModel.length,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
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
                    onPressed: () {
                      if (previous.value.isNotEmpty) {
                        futureCharacters =
                            fetchCharacterListRequestModel(previous.value);
                        setState(() {});
                      }
                    },
                    icon: previous.value.isNotEmpty
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
                    onPressed: () {
                      if (next.value.isNotEmpty) {
                        futureCharacters =
                            fetchCharacterListRequestModel(next.value);
                        setState(() {});
                      }
                    },
                    disabledColor:
                        next.value.isNotEmpty ? Colors.grey : Colors.blue,
                    icon: next.value.isNotEmpty
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
