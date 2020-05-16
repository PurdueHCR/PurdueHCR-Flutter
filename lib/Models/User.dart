
import 'package:purduehcr_web/Models/UserPermissionLevel.dart';

class User {

  static const String FIRST_NAME = "FirstName";
  static const String FLOOR_ID ="FloorID";
  static const String HOUSE = "House";
  static const String LAST_NAME = "LastName";
  static const String PERMISSION_LEVEL = "Permission Level";
  static const String LAST_SEMESTER_POINTS = "LastSemesterPoints";
  static const String TOTAL_POINTS = "TotalPoints";


  String firebaseToken = "";
  String firstName = "";
  String lastName = "";
  String floorId = "";
  String house = "";
  num lastSemesterPoints = -1;
  num totalPoints = -1;
  UserPermissionLevel permissionLevel = UserPermissionLevel.RESIDENT;
  String id = "";


  static User user = new User();

  void setUserFromJson(Map<String, dynamic>  data){
    id = data["id"];
    firstName = data[FIRST_NAME];
    lastName =  data[LAST_NAME];
    floorId = data[FLOOR_ID];
    house = data[HOUSE];
    lastSemesterPoints = data[LAST_SEMESTER_POINTS];
    totalPoints = data[TOTAL_POINTS];
    permissionLevel = UserPermissionLevelConverter.fromNum(data[PERMISSION_LEVEL]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "NAME: "+firstName+" "+lastName+" totalPoints: "+totalPoints.toString();
  }



}