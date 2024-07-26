import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/widgets/custom_alertdialog.dart';
import 'package:top_drive_app/widgets/outlined_card.dart';
import 'package:top_drive_app/data/student_sched_data.dart';

class ScheduleCard extends StatelessWidget {
  final List<StudentSchedData> schedule;
  final String schedType;

  const ScheduleCard({super.key, required this.schedule, required this.schedType});

  @override
  Widget build(BuildContext context) {
    return schedule.isEmpty ?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline),
        smallVSpace,
        Text('Nothing on your list of $schedType schedules.', style: smallBlack,),
      ],
    ) 
    : ListView.builder(
      itemCount: schedule.length,
      itemBuilder: ((context, index) {
        return OutlinedCard(
          color: primaryColor,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: schedule[index].instructorImg,
                  ),
                  mediumHSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(schedule[index].instructorName, style: smallBlackBold),
                      Text(schedule[index].course, style: smallBlack),
                    ],
                  ),
                ],
              ),
              mediumVSpace,
          
              Container(
                padding: smallPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.schedule, size: 24, color: whiteColor),
                    mediumHSpace,
                    Text(schedule[index].time, style: smallWhite),
                    const Spacer(),
                    Text(schedule[index].date, style: smallWhite),
                  ],
                )
              ),
              
              schedType == 'upcoming' ?
              Column(
                children: [
                  mediumVSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => CustomAlertDialog(
                            title: 'Cancel scheduled lesson?',
                            content: 'This action cannot be undone.',
                            onNotNowPressed: () => Navigator.pop(context),
                            onYesPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Schedule cancelled!'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          )     
                        ),
                        style: greyButton,
                        child: const Text('CANCEL')
                      ),
                      mediumHSpace,
                      ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => CustomAlertDialog(
                            title: 'Ask for a reschedule?',
                            content: 'This action cannot be undone.',
                            onNotNowPressed: () => Navigator.pop(context),
                            onYesPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Reschedule request sent!'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            },
                          ),
                        ),
                        style: blackButton,
                        child: const Text('RESCHEDULE')
                      ),
                    ],
                  )
                ],
              ) : const SizedBox()
            ],
          ),
        );
      }),
    );
  }
}