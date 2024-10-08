import 'package:flutter/material.dart';
import 'package:lati_marvel/models/movie_model.dart';

CustomGridTile(MoviesModel moviesModel) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
      Colors.black.withOpacity(0.5),
      Colors.black.withOpacity(0.1)
    ])),
    child: GridTile(
      child: Image.network(
        moviesModel.coverUrl,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null)
            return child;
          else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.black12,
            ));
          }
        },
      ),
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            Duration(minutes: moviesModel.duration).toString().substring(0, 4),
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            moviesModel.title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ]),
      ),
    ),
  );
}

CustomStack(MoviesModel moviesModel) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
      Colors.black.withOpacity(0.5),
      Colors.black.withOpacity(0.1)
    ])),
    child: Stack(
      children: [
        Image.network(
          moviesModel.coverUrl,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null)
              return child;
            else {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.black12,
              ));
            }
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                Duration(minutes: moviesModel.duration)
                    .toString()
                    .substring(0, 4),
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                moviesModel.title,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ]),
          ),
        ),
      ],
    ),
  );
}
