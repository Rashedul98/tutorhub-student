import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:tutorhub/utilities/colors.dart';
import 'package:tutorhub/utilities/functions/navigation.dart';
import 'package:tutorhub/views/home/loaders/update_tution_loader.dart';
import 'package:tutorhub/views/home/providers.dart';

import '../../controllers/get_tution/get_tution.dart';
import '../../utilities/enums.dart';

class HomeTutionList extends StatelessWidget {
  const HomeTutionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(getTutionProvider);
        if (state.dataState == DataState.initial) {
          ref.read(getTutionProvider.notifier).get();
        } else if (state.dataState == DataState.loaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProText(
                text: "Your Tutions",
                fontSize: 14,
                color: ProjectColors.primary,
              ),
              const ProGap(y: 16),
              Column(
                children: state.data!.results!.map((tution) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ProCard(
                      disableShadow: true,
                      width: double.infinity,
                      backgroundColor: ProjectColors.grey200,
                      borderRadius: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ProText(
                                  text: tution.teacherName,
                                  fontSize: 14,
                                  color: ProjectColors.primary,
                                ),
                              ),
                              Row(
                                children: [
                                  ProShape(
                                    height: 10,
                                    width: 10,
                                    radius: 5,
                                    color: tution.status ==
                                            TutionStatus.requested.value
                                        ? Colors.yellow[700]
                                        : tution.status ==
                                                TutionStatus
                                                    .pendingPayment.value
                                            ? Colors.yellow[700]
                                            : tution.status ==
                                                    TutionStatus.enrolled.value
                                                ? Colors.green
                                                : tution.status ==
                                                        TutionStatus
                                                            .rejected.value
                                                    ? Colors.red
                                                    : Colors.yellow[700],
                                  ),
                                  const ProGap(x: 4),
                                  ProText(
                                    color: ProjectColors.primary,
                                    fontSize: 12,
                                    text: tution.status ==
                                            TutionStatus.requested.value
                                        ? TutionStatus.requested.name
                                        : tution.status ==
                                                TutionStatus
                                                    .pendingPayment.value
                                            ? TutionStatus.pendingPayment.name
                                            : tution.status ==
                                                    TutionStatus.enrolled.value
                                                ? TutionStatus.enrolled.name
                                                : tution.status ==
                                                        TutionStatus
                                                            .rejected.value
                                                    ? TutionStatus.rejected.name
                                                    : tution.status ==
                                                            TutionStatus
                                                                .canceled.value
                                                        ? TutionStatus
                                                            .canceled.name
                                                        : "Unknown",
                                  )
                                ],
                              )
                            ],
                          ),
                          const ProGap(y: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ProText(
                                  text: "Subjects: ${tution.subjects?.map(
                                        (e) => e.subject,
                                      ).join(', ')}",
                                  fontSize: 12,
                                  color: ProjectColors.primary,
                                ),
                              ),
                              ProText(
                                text: "Fee: ${tution.fee} BDT",
                                fontSize: 12,
                                color: ProjectColors.primary,
                              ),
                            ],
                          ),
                          tution.status == TutionStatus.pendingPayment.value
                              ? Column(
                                  children: [
                                    const ProGap(y: 16),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ProButtonBasic(
                                            height: 32,
                                            text: "Cancel",
                                            backgroundColor:
                                                ProjectColors.red500,
                                            width: double.infinity,
                                            onTap: () {
                                              ref
                                                  .read(
                                                      updateTutionModelProvider
                                                          .notifier)
                                                  .update(
                                                    (state) => state.copyWith(
                                                      status: TutionStatus
                                                          .canceled.value,
                                                      id: tution.id,
                                                    ),
                                                  );
                                              loader(
                                                  screen:
                                                      const UpdateTutionLoader());
                                            },
                                          ),
                                        ),
                                        const ProGap(x: 16),
                                        Expanded(
                                          child: ProButtonBasic(
                                              height: 32,
                                              text: "Pay Now",
                                              backgroundColor:
                                                  ProjectColors.green500,
                                              width: double.infinity,
                                              onTap: () {
                                                ref
                                                    .read(
                                                        updateTutionModelProvider
                                                            .notifier)
                                                    .update(
                                                      (state) => state.copyWith(
                                                        status: TutionStatus
                                                            .enrolled.value,
                                                        id: tution.id,
                                                      ),
                                                    );
                                                loader(
                                                    screen:
                                                        const UpdateTutionLoader());
                                              }),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        } else if (state.dataState == DataState.empty) {
          return Center(
            child: ProText(
              text: "You do not have any tutions at the momment",
              fontSize: 14,
              color: ProjectColors.primary.withOpacity(0.7),
            ),
          );
        } else if (state.dataState == DataState.error) {
          return Center(
            child: Column(
              children: [
                const ProText(
                  text: "Something went wrong getting tutions.",
                  fontSize: 14,
                  color: ProjectColors.primary,
                ),
                const ProGap(y: 8),
                ProButtonBasic(
                  height: 32,
                  text: "Try Again",
                  onTap: () {
                    ref.read(getTutionProvider.notifier).reset();
                  },
                )
              ],
            ),
          );
        }
        return const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProText(
                text: "Loading Tutions",
              ),
              ProGap(x: 16),
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: ProjectColors.primary,
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
