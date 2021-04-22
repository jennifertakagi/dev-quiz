import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/shared.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Question 04",
                style: AppTextStyles.body,
              ),
              Text(
                "04/10",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(
            value: 0.7,
          ),
        ],
      ),
    );
  }
}
