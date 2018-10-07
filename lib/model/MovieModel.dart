

class MovieModel {
   MovieModel(value){
     //print(value);
      name=value['title'];
      directors=new List();
      casts=new List();

      year=value['year'];
      images=  new Avatar(value['images']);
      type=new List();
      id=value['id'];
      rating=new Rating(value['rating']);
      for(var cast in value['casts']){
        casts.add(new Cast(cast));
      }

      for(var director in value['directors']){
        directors.add(new Cast(director));
      }

      for(var genre in value['genres']){
           type.add(genre);
      }
}
   String id;
  String name;
  List<String> type;
  List<Cast> casts;
  List<Cast> directors;
  String year;
  Rating rating;
  Avatar images;

}
class Rating{
  Rating(value){
    print(value);
    max=value['max'];
    average=value['average'];
    stars=value['stars'];
    min=value['min'];
  }
    num max;
    num average;
    String stars;
    num min;

}
class Cast{
    Cast(value){
      alt=value['alt'];
      name=value['name'];
      id=value['id'];
      avatar=new Avatar(value['avatars']);
    }
   String alt;
   String name;
   String id;
   Avatar avatar;

}


class Avatar{
     Avatar(value){
     small=value['small'];
     large=value['large'];
     medium=value['medium'];
     }
   String small;
   String large;
   String medium;
}