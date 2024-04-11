import 'dart:math';
import 'package:dog_buddy_dog/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class DiscData {
  static final _rng = Random();

  double size;
  Color color;
  Alignment alignment;

  DiscData()
      : size = _rng.nextDouble() * 40 + 10,
        color = Color.fromARGB(
          _rng.nextInt(200),
          _rng.nextInt(255),
          _rng.nextInt(255),
          _rng.nextInt(255),
        ),
        alignment = Alignment(
          _rng.nextDouble() * 2 - 1,
          _rng.nextDouble() * 2 - 1,
        );
}

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class Event {
  final String title;

  Event({required this.title});

  String toString() => this.title;
}

class _CalenderState extends State<Calender> {
  @override
  final _discs = <DiscData>[];

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < 50; i++) {
      _discs.add(DiscData());
    }
  }

  void initState() {
    selectedEvent = {};
    _makeDiscs();
    super.initState();
  }

  List<Event> _getEventFromDay(DateTime date) {
    return selectedEvent[date] ?? [];
  }
  late Map<DateTime, List<Event>> selectedEvent;
  DateTime today = DateTime.now();
  CalendarFormat formet = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focused = DateTime.now();
  TextEditingController _eventController = TextEditingController();

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: transparent,

      ),
      body: GestureDetector(
        onTap: () => setState(() {
          _makeDiscs();
        }),
        child: Stack(
          children: [

            for(final disc in _discs)
              Positioned.fill(
                child: AnimatedAlign(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  alignment: disc.alignment,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    decoration: BoxDecoration(
                      color: disc.color,
                      shape: BoxShape.circle,
                    ),
                    height: disc.size,
                    width: disc.size,
                  ),
                ),
              ),
            TableCalendar(
              locale: "en_US",
              calendarFormat: formet,
              daysOfWeekVisible: true,
              startingDayOfWeek: StartingDayOfWeek.monday,
              onFormatChanged: (CalendarFormat _formet) {
                setState(() {
                  formet = _formet;
                });
              },
              onDaySelected: (DateTime selectday, DateTime focusDay) {
                setState(() {
                  selectedDay = selectday;
                  focused = focusDay;
                });
                print(focused);
              },
              eventLoader: _getEventFromDay,
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: true,
                defaultTextStyle: TextStyle(color: white),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              rowHeight: 8.h,
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 15),
              lastDay: DateTime.utc(2030, 3, 14),
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:  Colors.pink
                ),
                formatButtonTextStyle: TextStyle(
                  fontSize: 15.sp,
                  color: white,
                ),

                formatButtonShowsNext: false,
                titleTextStyle: TextStyle(color: Colors.white,fontSize: 16.sp),
                headerPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: white, fontSize: 12.sp),weekendStyle: const TextStyle
                (color: Colors.white)),

            ),
            ..._getEventFromDay(selectedDay).map((Event event) => ListTile(
                  title: Text(event.title),
                ))
          ],
        ),
      ),
      /*Column(
        children: [


        ],
      ),*/
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: pink,
        elevation: 0,
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Add Event'),
                  content: TextField(
                    controller: _eventController,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      child: const Text('ok'),
                      onPressed: () {
                        if (_eventController.text.isEmpty) {
                        } else {
                          if (selectedEvent[selectedDay] != null) {
                            selectedEvent[selectedDay]?.add(Event(title: _eventController.text));
                          } else {
                            selectedEvent[selectedDay] = [
                              Event(title: _eventController.text),
                            ];
                          }
                        }
                        Navigator.pop(context);
                        _eventController.clear();
                        setState(() {});
                        return;
                      },
                    )
                  ],
                )),
        label: const Text('Add Event'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
