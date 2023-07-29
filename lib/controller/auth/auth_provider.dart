import 'dart:developer';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _id = TextEditingController();
  final TextEditingController _name = TextEditingController();
  get name => _name;
  get id => _id;
  get formKey => _formKey;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> authenticate() async {
    try {
      _isLoading = true;
      notifyListeners();
      await Future.delayed(
        const Duration(seconds: 2),
        () => _isLoading = false,
      );
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      log('AuthProvider.authenticate failed :( \n $e');
    }
  }
}
