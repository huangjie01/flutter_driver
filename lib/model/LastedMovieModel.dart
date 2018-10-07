import 'dart:convert' show json;
import 'package:driver/model/MovieModel.dart';
class LastedMovieModel{
    LastedMovieModel(jsonStr){
      var jsonResult=json.decode(jsonStr);
      movieModelList=new List();
      List movieList= jsonResult['subjects'];
       //print(movieList);
      for(var movie in movieList){
       // print(movie);
        movieModelList.add(new MovieModel(movie));
      }
     // print('jsonResult'+jsonResult);
    }
   List<MovieModel> movieModelList;
}
