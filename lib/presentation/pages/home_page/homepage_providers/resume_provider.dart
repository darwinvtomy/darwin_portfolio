import 'package:darwin_portfolio/presentation/pages/home_page/homepage_services/getresume_service.dart';
import 'package:flutter/material.dart';

import '../homepage_models/resume_model.dart';

class Resumeprovider with ChangeNotifier {
  final ResumeService _service = ResumeService();
  bool isLoading = true;
  late Resume _resume;
  Resume get resume => _resume;
  Future<void> getAllResumeDetails() async {
    isLoading = true;

    final response = await _service.getTheResume();
    _resume = response;
    isLoading = false;
    notifyListeners();
  }
}
