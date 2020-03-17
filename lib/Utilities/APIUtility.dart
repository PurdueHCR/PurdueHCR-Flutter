
import 'package:purduehcr_web/Models/HTTPError.dart';
import 'package:purduehcr_web/Models/User.dart' as PHCRUser;
import 'package:purduehcr_web/Utilities/HttpUtility.dart';

class APIUtility {

  static String domain = "https://us-central1-purdue-hcr-test.cloudfunctions.net/";

  static Future<PHCRUser.User> getUser(){
    return Network.get(domain+"user/get").then((userMap){
      PHCRUser.User.user.setUserFromJson(userMap);
      return Future.value(PHCRUser.User.user);
    });

  }

  static Future<PHCRUser.User> getUserRank() {
    return Network.get(domain+"user/auth-rank").then((rankJson) {
      PHCRUser.User.user.setHouseRankingsFromJson(rankJson);
      return Future.value(PHCRUser.User.user);
    });

  }
}