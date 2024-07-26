import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:top_drive_app/constants/constants.dart';
import 'package:top_drive_app/data/instructor_sched_data.dart';
import 'package:top_drive_app/widgets/custom_alertdialog.dart';
import 'package:top_drive_app/widgets/outlined_card.dart';

class InstructorSchedule extends StatefulWidget {
  const InstructorSchedule({super.key});

  @override
  _InstructorScheduleState createState() => _InstructorScheduleState();
}

class _InstructorScheduleState extends State<InstructorSchedule> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleRow(),
            largeVSpace,
            _buildDatePicker(),
            largeVSpace,
            _buildScheduleList(),
          ],
        ),
      );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('SCHEDULE', style: blackPageTitle),
        const Icon(Icons.filter_list_rounded),
      ],
    );
  }

  Widget _buildDatePicker() {
    return DatePicker(
      DateTime.now(),
      height: kToolbarHeight * 1.75,
      width: MediaQuery.of(context).size.width / 6,
      initialSelectedDate: _selectedDate,
      selectionColor: primaryColor,
      selectedTextColor: whiteColor,
      activeDates: _getMarkedDates(),
      onDateChange: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
    );
  }
  
  Widget _buildScheduleList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: instructorSched.length,
      itemBuilder: (context, index) {
        if (_getDateOnly(instructorSched[index].date) == _getDateOnly(_selectedDate)) {
          return _buildCard(instructorSched[index]);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  DateTime _getDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  List<DateTime> _getMarkedDates() {
    List<DateTime> markedDates = [];
    for (var schedule in instructorSched) {
      DateTime dateOnly = _getDateOnly(schedule.date);
      markedDates.add(dateOnly);
    }
    return markedDates;
  }

  Widget _buildCard(InstructorSchedData schedule) {
    return OutlinedCard(
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(schedule.course, style: smallBlackBold),
          Text('Student: ${schedule.students.join(', ')}', style: smallBlack),
          Text('Time: ${schedule.time}', style: smallBlack),
          mediumVSpace,

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => CustomAlertDialog(
                  title: 'Mark schedule as done?',
                  content: 'This action cannot be undone.',
                  onNotNowPressed: () => Navigator.pop(context),
                  onYesPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Schedule marked as done!'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                )     
              ),
              style: orangeButton,
              child: const Text('MARK AS DONE'),
            ),
          ),
        ],
      ),
    );
  }
}
