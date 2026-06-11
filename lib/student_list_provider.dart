import 'package:attendance_summery_flutter/data/student.dart';
import 'package:flutter/foundation.dart';

class StudentListProvider extends ChangeNotifier {
  final List<Student> _students = [
    Student(1, "Rifat Hossain", false),
    Student(2, "Rahim Uddin", false),
    Student(3, "Karim Hasan", false),
    Student(4, "Nusrat Jahan", false),
    Student(5, "Sadia Islam", false),
    Student(6, "Tanvir Ahmed", false),
    Student(7, "Mehedi Hasan", false),
    Student(8, "Fatema Akter", false),
    Student(9, "Shakil Khan", false),
    Student(10, "Mim Rahman", false),
  ];

  List<Student> get presentStudent =>
      _students.where((s) => s.isPresent).toList();

  List<Student> get absentStudent =>
      _students.where((s) => !s.isPresent).toList();

  List<Student> get students => _students;

  void changeStatus(int index, bool value) {
    _students[index] = Student(
      _students[index].id,
      _students[index].name,
      value,
    );
    notifyListeners();
  }

  void resetAttendance() {
    for (int i = 0; i < _students.length; i++) {
      _students[i] = Student(_students[i].id, _students[i].name, false);
    }

    notifyListeners();
  }
}
