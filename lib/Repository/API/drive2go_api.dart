import 'dart:convert';
import 'package:drive2go/Repository/Modelclass/AllcarsModel.dart';
import 'package:drive2go/Repository/Modelclass/BuycarModel.dart';
import 'package:drive2go/Repository/Modelclass/SigninModel.dart';
import 'package:drive2go/Repository/Modelclass/SignupModel.dart';
import 'package:drive2go/Repository/Modelclass/mycarModel.dart';
import 'package:drive2go/Repository/Modelclass/nearbyModel.dart';
import 'package:drive2go/Repository/Modelclass/searchModel.dart';
import 'package:http/http.dart';
import 'api_client.dart';

class UserMainApi {
  ApiClient apiClient = ApiClient();

  Future<SignupModel> getsignup(String name,String email,String phone,String password) async {
    String trendingpath = 'http://45.159.221.50:8868/api/signup';
    var body = {
      "fullName": name,
      "email": email,
      "phone": phone,
      "password": password,
    };

    print("details"+body.toString());
    Response response = await apiClient.invokeAPI(trendingpath, 'POST',jsonEncode(body));

    return SignupModel.fromJson(jsonDecode(response.body));
  }
  Future<SigninModel> getsignin(String email,String password) async {
    String trendingpath =
        'http://45.159.221.50:8868/api/signin';
    var body = {
      "email": email,
      "password": password
    }
    ;
    print("hello"+body.toString());
    Response response = await apiClient.invokeAPI(trendingpath, 'POST',jsonEncode(body),);

    return SigninModel.fromJson(jsonDecode(response.body));
  }
  Future<List<NearbyModelClass>> getnearby(String lat, String long) async {
    String trendingpath =
        'http://45.159.221.50:8868/api/get-nearby-vehicles?latitude=$lat&longitude=$long';
    var body = {

    }
    ;
    print("hello"+body.toString());
    Response response = await apiClient.invokeAPI(trendingpath, 'GET',(body),);

    return NearbyModelClass.listFromJson(jsonDecode(response.body));
  }
  Future<List<AllcarsModel>> getallcars() async {
    String trendingpath =
        'http://45.159.221.50:8868/api/get-vehicles';
    var body = {

    }
    ;
    print("hello"+body.toString());
    Response response = await apiClient.invokeAPI(trendingpath, 'GET',(body),);

    return AllcarsModel.listFromJson(jsonDecode(response.body));
  }
  Future<List<BuycarModel>> getbuycar() async {
    String trendingpath =
        'http://45.159.221.50:8868/api/get-buyvehicles';
    var body = {

    }
    ;
    print("hello"+body.toString());
    Response response = await apiClient.invokeAPI(trendingpath, 'GET',(body),);

    return BuycarModel.listFromJson(jsonDecode(response.body));
  }
  Future<List<SearchModel>> getsearch(String brandname) async {
    String trendingpath =
        'http://45.159.221.50:8868/api/search-buyvehicles?brand=$brandname';
    var body = {

    }
    ;
    print("hello"+body.toString());
    Response response = await apiClient.invokeAPI(trendingpath, 'GET',(body),);

    return SearchModel.listFromJson(jsonDecode(response.body));
  }
  Future<List<MycarModel>> getmycar() async {
    String trendingpath =
        'http://45.159.221.50:8868/api/get-buy-orders/66ceb30f2dc300b0b85f6244';
    var body = {

    }
    ;
    print("hello"+body.toString());
    Response response = await apiClient.invokeAPI(trendingpath, 'GET',(body),);

    return MycarModel.listFromJson(jsonDecode(response.body));
  }
}

