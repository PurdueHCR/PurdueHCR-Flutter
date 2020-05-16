import 'package:meta/meta.dart';

class PointLog{

  static const String APPROVED_BY = "ApprovedBy";
  static const String APPROVED_ON = "ApprovedOn";
  static const String DATE_OCCURRED = "DateOccurred";
  static const String DATE_SUBMITTED = "DateSubmitted";
  static const String DESCRIPTION = "Descrption";
  static const String FLOOR_ID = "FloorID";
  static const String POINT_TYPE_ID = "PointTypeID";
  static const String RHP_NOTIFICATION = "RHPNotification";
  static const String RESIDENT_FIRST_NAME = "ResidentFirstName";
  static const String RESIDENT_ID = "ResidentId";
  static const String RESIDENT_LAST_NAME = "ResidentLastName";
  static const String RESIDENT_NOTIFICATIONS = "ResidentNotifications";

  DateTime approvedOn;
  String approvedBy;
  DateTime dateOccurred;
  DateTime dateSubmitted;
  String description;
  String floorId;
  int pointTypeId;
  int rhpNotifications;
  String residentFirstName;
  String residentId;
  String residentLastName;
  int residentNotifications;
  String id;

  PointLog({
      @required this.dateOccurred,
      @required this.dateSubmitted,
      @required this.description,
      @required this.floorId,
      @required this.pointTypeId,
      @required this.rhpNotifications,
      @required this.residentFirstName,
      @required this.residentId,
      @required this.residentLastName,
      @required this.residentNotifications,
      @required this.id,
      this.approvedBy,
      this.approvedOn
});

  factory PointLog.fromJson(String id, Map<String, dynamic> json){
    return PointLog(
      dateOccurred: DateTime.parse(json[DATE_OCCURRED]),
      dateSubmitted: DateTime.parse(json[DATE_SUBMITTED]),
      description: json[DESCRIPTION],
      floorId: json[FLOOR_ID],
      pointTypeId: json[POINT_TYPE_ID],
      rhpNotifications: json[RHP_NOTIFICATION],
      residentFirstName: json[RESIDENT_FIRST_NAME],
      residentId: json[RESIDENT_ID],
      residentLastName: json[RESIDENT_LAST_NAME],
      residentNotifications: json[RESIDENT_NOTIFICATIONS],
      id: id,
      approvedBy: json[APPROVED_BY],
      approvedOn: (json[APPROVED_ON])?DateTime.parse(json[APPROVED_ON]): null
    );
  }
}