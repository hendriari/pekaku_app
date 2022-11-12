import 'package:flutter/material.dart';

class TextFieldValidator {
  static late GlobalKey<FormState> key;


  /// username validator
  static String usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username tidak boleh kosong !';
    } else if (value.length < 6) {
      return 'Username minimal 6 karakter !';
    }
    return '';
  }

  /// email validator
  static String emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong !';
    }
    return '';
  }

  /// alamat validator
  static String alamatValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alamat tidak boleh kosong !';
    }
    return '';
  }

  /// tanggal register validator
  static String tangggalLahirValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tanggal lahir tidak boleh kosong !';
    }
    return '';
  }

  /// jenis register validator
  static String jenisKelaminValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Jenis kelamin tidak boleh kosong !';
    }
    return '';
  }

  /// password validator
  static String passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong !';
    }
    return '';
  }

  /// cek password validator
  static String cekPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong !';
    } else if (value != passwordValidator(value)){
      return 'Password tidak sama !';
    }
    return '';
  }

  /// username validator
  static String keteranganValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username tidak boleh kosong !';
    }
    return '';
  }
}
