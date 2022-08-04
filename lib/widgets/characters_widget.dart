import 'dart:convert';

import 'package:encyclopedia_star_wars/models/character_model.dart';
import 'package:encyclopedia_star_wars/models/request_model.dart';
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
                  itemBuilder: (context, index) => Text(
                      '${listCharacterModel[index].name}\n        ${listCharacterModel[index].birthYear}'),
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