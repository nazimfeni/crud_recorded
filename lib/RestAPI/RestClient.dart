import 'dart:convert';
import 'package:crud_recorded/style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> ProductCreateRequest(FormValue) async{
  var URL =Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(FormValue);
  var PostHeader ={"Content-Type":"application/json"};
  var response = await http.post(URL,headers:PostHeader,body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast('Request Success');
    return true;
  }
  else
    {
      ErrorToast('Request fail! Try again');
      return false;
    }
}