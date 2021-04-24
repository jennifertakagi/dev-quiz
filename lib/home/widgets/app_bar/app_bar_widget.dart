import 'package:flutter/material.dart';

import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/shared.dart';
import '../widgets_home.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({
    required this.user,
  }) : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 161,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Hello, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(
                    completedPercent: (user.score / 100),
                  ),
                ),
              ],
            ),
          ),
        );
}
