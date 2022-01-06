class AnimalSuggestion{
  static final List<String> animalList=["Dog","Cat","Bird","Rabbit","Fish","Others"];
  static List<String> getSuggestions(String query){
    return List.of(animalList).where((animal) {
      final animalLower=animal.toLowerCase();
      final queryLower=query.toLowerCase();
      return animalLower.contains(queryLower);
    }).toList();
  }
}
class DogSuggestion{
  static final List<String> dogList=["Pug","Golden Retriever","Hound"];
  static List<String> getSuggestions(String query){
    return List.of(dogList).where((dog) {
      final dogLower=dog.toLowerCase();
      final queryLower=query.toLowerCase();
      return dogLower.contains(queryLower);
    }).toList();
  }
}
class CatSuggestion{
  static final List<String> catList=["Pussy Cat","Bengal Cat","VulVal cat"];
  static List<String> getSuggestions(String query){
    return List.of(catList).where((cat) {
      final catLower=cat.toLowerCase();
      final queryLower=query.toLowerCase();
      return catLower.contains(queryLower);
    }).toList();
  }
}
class OthersSuggestion{
  static final List<String> othersList=["gacher saap","khater tolaar vut","lal ronger kochchop"];
  static List<String> getSuggestions(String query){
    return List.of(othersList).where((others) {
      final othersLower=others.toLowerCase();
      final queryLower=query.toLowerCase();
      return othersLower.contains(queryLower);
    }).toList();
  }
}