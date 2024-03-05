// in excle.dart

import 'dart:io';

import 'package:attendance_system/attendance_takingScreen.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class ExcelExporter {
  static Future<void> exportToExcel(List<StudentModel> students) async {
    // Create Excel workbook and worksheet
    final Excel excel = Excel.createExcel();
    final Sheet sheetObject = excel['Sheet1'];

    // Add headers`
    sheetObject.appendRow(['ID', 'Name', 'Attendance Status']);

    // Add student data
    for (final student in students) {
      sheetObject.appendRow(
          [student.id, student.name, student.isPresent ? 'Present' : 'Absent']);
    }

    // Save the file
    final String fileName = 'attendance_data.xlsx';
    final String path = (await getExternalStorageDirectory())!.path;
    final String filePath = '$path/$fileName';

    // Change this line to handle nullable list
    final List<int>? excelBytes = await excel.encode();
    if (excelBytes != null) {
      await File(filePath).writeAsBytes(excelBytes);
    } else {
      print('Error: Excel encoding failed');
    }

    print('File saved at: $filePath');
  }
}
