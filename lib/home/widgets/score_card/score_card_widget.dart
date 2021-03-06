import 'package:flutter/material.dart';

import 'package:DevQuiz/home/widgets/chart/chart_widget.dart';
import 'package:DevQuiz/core/core.dart';

class ScoreCardWidget extends StatelessWidget {
  final double completedPercent;

  const ScoreCardWidget({
    Key? key,
    required this.completedPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
          height: 136,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: ChartWidget(
                  completedPercent: completedPercent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's start",
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        "Complete challenges and advance knowledge",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
