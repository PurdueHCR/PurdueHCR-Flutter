
import 'package:purduehcr_web/HTTPError.dart';
import 'package:purduehcr_web/User.dart' as PHCRUser;
import 'package:purduehcr_web/Utilities/HttpUtility.dart';

class APIUtility {

  static String domain = "https://us-central1-purdue-hcr-test.cloudfunctions.net/";

  static Future<PHCRUser.User> getUser() async{
    Map<String,dynamic> json = await Network.get(domain+"user/get");
    PHCRUser.User.user.setUserFromJson(json);
    return PHCRUser.User.user;
  }

  static Future<void> getUserRank() async {
    Map<String,dynamic> json = await Network.get(domain+"user/auth-rank");
    PHCRUser.User.user.setHouseRankingsFromJson(json);
    return;
  }
}