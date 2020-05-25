import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final TextInputType keyboardType;

  AdaptativeTextField({
    this.label,
    this.controller,
    this.onSubmitted,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: Theme.of(context).textTheme.headline4
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              placeholder: label,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          );
  }
}
