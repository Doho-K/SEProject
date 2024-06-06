import 'package:get/get.dart';

class DataController extends GetxController {
  var selectedUser = 0.obs;
  List<user> users = [
    user(name: '김교수', role: '교수', id: 1, permission: true, courses: ['소프트웨어공학', '컴퓨터구조']),
    user(name: '박조교', role: '조교', id: 2, permission: true, courses: ['소프트웨어공학']),
    student(name: '이학생', role: '학생', id: 3, permission: false, courses: ['소프트웨어공학'], grades: {'소프트웨어공학':90}),];

  void changeRole(int role) {
    selectedUser.value = role;
  }
}

class user{
  String name ="";
  String role ="";
  int id = 0;
  bool permission = false;
  List<String> courses = [];

  user({required this.name, required this.role, required this.id, required this.permission, required this.courses});
}

class student extends user{
  Map<String, double> grades = {};
  student({required String name, required String role, required int id, required bool permission, required List<String> courses, required Map<String, double> grades}) : super(name: name, role: role, id: id, permission: permission, courses: courses);
}
