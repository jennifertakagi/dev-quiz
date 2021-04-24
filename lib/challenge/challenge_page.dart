import 'package:flutter/material.dart';

import 'challenge_controller.dart';
import 'widget/widgets_challenge.dart';
import 'package:DevQuiz/shared/shared.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(
      () {
        controller.currentQuestion = pageController.page!.toInt() + 1;
      },
    );
    super.initState();
  }

  void nextPage() {
    if (controller.currentQuestion < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var totalQuestions = widget.questions.length;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentQuestionNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentQuestion: value,
                  totalQuestions: totalQuestions,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onChange: nextPage,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentQuestionNotifier,
            builder: (context, value, _) => (value == totalQuestions)
                ? Row(children: [
                    Expanded(
                      child: NextButtonWidget.green(
                        label: "Confirm",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ])
                : Expanded(
                    child: NextButtonWidget.white(
                      label: "Skip",
                      onTap: nextPage,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
