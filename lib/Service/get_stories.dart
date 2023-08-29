import 'package:storys/Model/stories.dart';
import 'package:http/http.dart' as http;


class GetStoriesService{
  Future<List<Stories>?> getStory() async {
    var client= http.Client();
    var uri= Uri.parse('http://itspearls.mooo.com/stories/mystorys');
    var response = await client.get(uri);

    if(response.statusCode==200){
      var jsonResponse= response.body;
      return storiesFromJson(jsonResponse);
    }



  }
}