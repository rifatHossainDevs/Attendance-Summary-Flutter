import 'package:attendance_summery_flutter/student_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widget/persent_indicator.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StudentListProvider>();

    int totalPresent = provider.presentStudent.length;
    int totalAbsent = provider.absentStudent.length;
    int totalStudent = provider.students.length;

    final presentNames = provider.presentStudent
        .map((student) => student.name)
        .join(", ");
    final absentNames = provider.absentStudent
        .map((student) => student.name)
        .join(", ");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
            ),

            SizedBox(height: 16),

            Center(
              child: Text(
                "Attendance Summary",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PercentIndicator(
                  title: 'Present',
                  current: totalPresent,
                  total: totalStudent,
                  progressColor: Color(0xFF28D876),
                  backgroundColor: Color(0xFF65F69D),
                  titleColor: Colors.black,
                ),

                PercentIndicator(
                  title: "Absent",
                  current: totalAbsent,
                  total: totalStudent,
                  progressColor: Color(0xFF7791AA),
                  backgroundColor: Color(0xFFA3B5D0),
                  titleColor: Color(0xFF62758C),
                ),
              ],
            ),

            SizedBox(height: 40),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFDBE2E4)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Present Students: ($totalPresent)",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Text(
                      "($presentNames)",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),

                    SizedBox(height: 16),

                    Text(
                      "Absent Students: ($totalAbsent)",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Text(
                      "($absentNames)",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
