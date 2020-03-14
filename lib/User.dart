
class User {

  static const String FIRST_NAME = "FirstName";
  static const String FLOOR_ID ="FloorID";
  static const String HOUSE = "House";
  static const String LAST_NAME = "LastName";
  static const String PERMISSION_LEVEL = "Permission Level";
  static const String LAST_SEMESTER_POINTS = "LastSemesterPoints";
  static const String TOTAL_POINTS = "TotalPoints";

  static const String API_HOUSE_RANK = "houseRank";
  static const String API_SEMESTER_RANK = "semesterRank";


  String firebaseToken = "";
  String firstName = "";
  String lastName = "";
  String floorId = "";
  String house = "";
  num lastSemesterPoints = -1;
  num totalPoints = -1;
  String id = "";
  num houseRank = -1;
  num semesterRank = -1;

  static User user = new User();

  void setUserFromJson(Map<String, dynamic>  data){
    id = data["id"];
    firstName = data[FIRST_NAME];
    lastName =  data[LAST_NAME];
    floorId = data[FLOOR_ID];
    house = data[HOUSE];
    lastSemesterPoints = data[LAST_SEMESTER_POINTS];
    totalPoints = data[TOTAL_POINTS];
  }

  void setHouseRankingsFromJson(Map<String, dynamic> data){
    houseRank = data[API_HOUSE_RANK];
    semesterRank = data[API_SEMESTER_RANK];
  }





}