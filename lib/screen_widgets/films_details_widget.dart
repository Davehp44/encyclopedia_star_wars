import 'package:encyclopedia_star_wars/constants/stringValues.dart';
import 'package:encyclopedia_star_wars/models/film_model.dart';
import 'package:flutter/material.dart';

class FilmsDetailsWidget extends StatelessWidget {
  final FilmModel filmModel;

  const FilmsDetailsWidget({required this.filmModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(details),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Hero(
                        tag: '${filmModel.title} img',
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
                                border:
                                    Border.all(width: 1, color: Colors.blue)),
                            child: const Icon(
                              Icons.perm_media,
                              size: 100,
                              color: Colors.blue,
                            ),
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text(filmModel.title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontStyle: FontStyle.normal),
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text('Director: ${filmModel.director}',
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
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text(
                        'Opening Crawl: ${filmModel.openingCrawl.replaceAll("\n", "")}',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text(
                        'Producer: ${filmModel.producer}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Text(
                        'Release Date: ${filmModel.releaseDate}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
