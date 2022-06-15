import 'package:flutter/material.dart';
const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  //labelText: 'Email',
  labelStyle: TextStyle(fontSize: 15, color: Colors.brown),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown, width: 2),
  ),
  border:
  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
);