import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/shared.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.totalQuestions,
  }) : super(key: key);

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
                "Question $currentQuestion",
                style: AppTextStyles.body,
              ),
              Text(
                "of $totalQuestions",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(
            value: currentQuestion / totalQuestions,
          ),
        ],
      ),
    );
  }
}
