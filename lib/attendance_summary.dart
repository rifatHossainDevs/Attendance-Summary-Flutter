import 'package:attendance_summery_flutter/screens/attendance_screen.dart';
import 'package:attendance_summery_flutter/student_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendanceSummary extends StatelessWidget {
  const AttendanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> StudentListProvider(),
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AttendanceScreen(),
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFEAF1F7)
          ),
        ),
      ),
    );
  }
}
