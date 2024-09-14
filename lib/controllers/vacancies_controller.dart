import 'package:flutter/material.dart';
import '../models/api_service.dart';
import '../models/vacancy.dart';

class VacanciesController extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Vacancy> _vacancies = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Vacancy> get vacancies => _vacancies;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> loadVacancies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _vacancies = await _apiService.fetchVacancies();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
