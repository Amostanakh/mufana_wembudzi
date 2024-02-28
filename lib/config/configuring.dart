// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbudzi/models/user.model.dart';

Rx<UserModel?> kUser = (null as UserModel?).obs;

keyboardUnFocus() => FocusManager.instance.primaryFocus?.unfocus();

const orangeColor = Colors.orange;
const greenColor = Color(0xFF13EE1A);

const baseUrl = 'https://mbudzi.onrender.com/api';
