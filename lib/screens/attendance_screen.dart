import 'package:attendance_summery_flutter/screens/summary_screen.dart';
import 'package:attendance_summery_flutter/student_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    final String todayDate = DateFormat('MMMM d').format(DateTime.now());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_outlined, color: Colors.black),

            SizedBox(height: 16),

            Text(
              "Daily Attendance - $todayDate",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 12),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFDBE2E4)),
                ),
                child: Consumer<StudentListProvider>(
                  builder: (context, studentListProvider, _) {
                    return ListView.builder(
                      itemCount: studentListProvider.students.length,
                      itemBuilder: (context, index) {
                        final student = studentListProvider.students[index];

                        return CheckboxListTile(
                          checkboxScaleFactor: 1,
                          checkColor: Colors.white,
                          secondary: Text(
                            "${student.id}.",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          side: BorderSide(
                            color: Color(0xFFA7A7A8),
                            width: 1.5,
                          ),
                          hoverColor: Colors.transparent,
                          activeColor: Color(0xFF13DC69),
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(
                            "${student.name}.",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          value: student.isPresent,
                          onChanged: (bool? value) {
                            context.read<StudentListProvider>().changeStatus(
                              index,
                              value!,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 44,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xFF0A77DC),
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final provider = context.read<StudentListProvider>();

                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SummaryScreen()),
                  );
                  if (!mounted) return;
                  provider.resetAttendance();
                },
                child: Text(
                  "Submit",
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
