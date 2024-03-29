import 'package:dental_workflow/constants/colors.dart';
import 'package:flutter/material.dart';

ButtonStyle blueButton = TextButton.styleFrom(
  backgroundColor: darkBlue,
  fixedSize: const Size(200,50),
  disabledBackgroundColor: darkBlue,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0)
  ),
);

ButtonStyle fullWidthButton = TextButton.styleFrom(
  backgroundColor: darkBlue,
 //fixedSize: const Size(200,50),
  disabledBackgroundColor: darkBlue,
  padding: EdgeInsets.all(8.0),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0)
  ),
);