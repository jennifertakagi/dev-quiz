import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color fontColor;
  final String label;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.fontColor,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.darkGreen,
        this.borderColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label,
        this.onTap = onTap;

  NextButtonWidget.purple({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.purple,
        this.borderColor = AppColors.white,
        this.fontColor = AppColors.white,
        this.label = label,
        this.onTap = onTap;

  NextButtonWidget.transparent({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.transparent,
        this.borderColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.label = label,
        this.onTap = onTap;

  NextButtonWidget.white({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.fontColor = AppColors.grey,
        this.label = label,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor,
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
