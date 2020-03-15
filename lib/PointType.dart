class PointType {
  String description;
  bool isEnabled;
  String name;
  int permissionLevel;
  bool canResidentsSubmit;
  int value;
  int id;

  PointType(this.description, this.isEnabled, this.name, this.permissionLevel, this.canResidentsSubmit, this.value, this.id);

  static List<PointType> getSamplePointTypes() {
    List<PointType> list = new List<PointType>();
    list.add(new PointType("abc", true, "John", 3, false, 10, 0));
    list.add(new PointType("Hello", true, "Bob", 7, true, 5, 1));
    list.add(new PointType("bye", true, "Smith", 5, false, 4, 2));
    return list;
  }
}