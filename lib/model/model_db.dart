class StudentModel {
  int? id;
  final String name;
  final String classRoom;
  final String guardian;
  final String phone;
  final String image;
  StudentModel(
      {this.id,
      required this.name,
      required this.classRoom,
      required this.guardian,
      required this.phone,
      required this.image});
  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final classRoom = map['classRoom'] as String;
    final guardian = map['guardian'] as String;
    final phone = map['phone'] as String;
    final image = map['map'] as String;
    return StudentModel(
        id: id,
        name: name,
        classRoom: classRoom,
        guardian: guardian,
        phone: phone,
        image: image);
  }
}
