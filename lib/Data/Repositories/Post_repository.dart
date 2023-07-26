import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobilicis/Data/Models/Post_Model.dart';
import 'package:mobilicis/Data/Models/Search_Model.dart';
import 'package:mobilicis/Data/Repositories/api/api.dart';

class PostRepository {

  API api = API();
  Future<List<PostModel>> fetchPosts() async {
    try{
      Response response = await api.sendRequest.get("/getListings?page=2&limit=10%27");
      List<dynamic> postMaps = response.data["listings"];
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch(ex){
      throw ex;
    }
  }

  Future<Map<String, List<dynamic>>> searchDevices(String searchModel) async {
    try{
      final requestBody = SearchModel(searchModel: searchModel);
      Response response = await api.sendRequest
          .post("/searchModel", data: requestBody.toJson());
      // List<dynamic> searchMaps = response.data;
      // return response.data;
      Map<String, dynamic> responseData = response.data;

      // Check if the 'makes' and 'models' keys exist in the responseData
      if (responseData.containsKey('makes') && responseData.containsKey('models')) {
        List<dynamic> makesList = responseData['makes'];
        List<dynamic> modelsList = responseData['models'];

        // Create a new Map with the 'makes' and 'models' lists
        Map<String, List<dynamic>> searchResults = {
          'makes': makesList,
          'models': modelsList,
        };

        // List<SearchModel> searchModels = [];
        //
        // // Create a new instance of SearchModel and add it to the list for each item in 'makes' and 'models' lists
        // for (String make in responseData['makes']) {
        //   searchModels.add(SearchModel(makes: [make]));
        // }
        //
        // for (String model in responseData['models']) {
        //   searchModels.add(SearchModel(models: [model]));
        // }

        return searchResults;

      } else {
        // Handle the case when the 'makes' and 'models' keys are not found in the response
        throw Exception("Invalid API response: 'makes' and 'models' keys not found");
      }

    } catch(ex){
      throw ex;
    }
  }
  
  
  Future<Map<String, List<dynamic>>>  getFilters() async{
    
    try{
      Response response = await api.sendRequest.get("/getFilters?isLimited=true");
      Map<String, dynamic> responseData = response.data["filters"];

        List<dynamic> makeList = responseData["make"];
        List<dynamic> makecondition = responseData["condition"];
        List<dynamic> makeStorage = responseData["storage"];
        List<dynamic> makeRam = responseData["ram"];


        Map<String, List<dynamic>> filterResults = {
          "make" : makeList,
          "condition" : makecondition,
          "storage" : makeStorage,
          "ram" : makeRam,
        };


        return filterResults;

    } catch (ex){
      throw ex;
    }
    
  }



}