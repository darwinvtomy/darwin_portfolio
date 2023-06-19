import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../resources/strings_manager.dart';
import '../homepage_models/resume_model.dart';

class ResumeService {
  Future<Resume> getTheResume() async {
    var jsonText = await rootBundle.loadString(AppStrings.data_location);
    Map<String, dynamic> data = json.decode(jsonText);
    Resume resume = Resume.fromJson(data);
    // await Future.delayed(const Duration(seconds: 2));
    return resume;
  }
}
