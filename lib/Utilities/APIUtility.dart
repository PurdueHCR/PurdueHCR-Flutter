import 'package:purduehcr_web/Models/PointType.dart';
import 'package:purduehcr_web/Models/User.dart' as PHCRUser;
import 'package:purduehcr_web/Models/UserRank.dart';
import 'package:purduehcr_web/Utilities/HttpUtility.dart';

class APIUtility {

  //static String domain = "https://us-central1-purdue-hcr-test.cloudfunctions.net/";
  static String domain = "http://localhost:5001/purdue-hcr-test/us-central1/";

  static Future<PHCRUser.User> getUser(){
    return Network.get(domain+"user/get").then((userMap){
      PHCRUser.User.user.setUserFromJson(userMap);
      return Future.value(PHCRUser.User.user);
    });

  }

  static Future<UserRank> getUserRank() {
    return Network.get(domain+"user/auth-rank").then((rankJson) {
      return Future.value(UserRank.fromJson(rankJson));
    });
  }

  static Future<List<PointType>> getPointTypes(){
    return Network.get(domain+"point_type/get").then((pointTypeList) {
      Set<Map<String, dynamic>> tps = Set.from(pointTypeList);
      List<PointType> types = new List();
      tps.forEach((element) {
        types.add(PointType.fromJson(element));
      });
      print("TYPES: "+types.toString());
      return Future.value(types);
    });
  }

  static Future<String> submitPoint(String description, DateTime dateOccurred, String pointTypeId){
    return Network.post(domain+"user/submitPoint", body: {"description": description, "date_occurred":dateOccurred.toString(), "point_type_id":pointTypeId})
        .then((value) => value["message"]);
  }
}