import 'package:get/get.dart';

class DataController extends GetxController {
  var selectedUser = 0.obs;
  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() {
    // 예시 데이터를 추가합니다.
    users.assignAll([
      User(name: '김교수', role: '교수', id: 1, permission: true, courses: ['소프트웨어공학', '컴퓨터구조']),
      User(name: '박조교', role: '조교', id: 2, permission: true, courses: ['소프트웨어공학']),
      Student(name: '이학생', role: '학생', id: 3, permission: false, courses: ['소프트웨어공학','컴퓨터구조'], grades: {'소프트웨어공학':90, '컴퓨터구조':80})
    ]);
  }
  void changeRole(int role) {
    selectedUser.value = role;
  }

  void checkGrades(Student student) {
    if (student.grades.containsKey('소프트웨어공학')) {
      double? softwareEngineeringGrade = student.grades['소프트웨어공학'];
      print('소프트웨어공학 성적: $softwareEngineeringGrade');
    } else {
      print('소프트웨어공학 과목이 존재하지 않습니다.');
    }
  }

  void updateGrade(int studentId, String course, double grade) {
    var student = users.firstWhere((user) => user.id == studentId && user is Student) as Student;
    student.grades[course] = grade;
    users.refresh();
  }

  List<Student> getStudentsByCourse(String course) {
    return users.where((user) => user is Student && user.courses.contains(course)).map((user) => user as Student).toList();
  }
}

class User {
  String name;
  String role;
  int id;
  bool permission;
  List<String> courses;

  User({required this.name, required this.role, required this.id, required this.permission, required this.courses});
}

class Student extends User {
  Map<String, double> grades;

  Student({
    required String name,
    required String role,
    required int id,
    required bool permission,
    required List<String> courses,
    required this.grades,
  }) : super(name: name, role: role, id: id, permission: permission, courses: courses);
}

