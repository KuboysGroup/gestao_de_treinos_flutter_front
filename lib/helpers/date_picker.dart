// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

enum SelectorType { day, month }

enum SelectorFormat { single, range }

class KDatePicker extends StatefulWidget {
  final SelectorType type;
  final SelectorFormat format;
  final Function(DateTime) onDateSelected;
  final String title;

  const KDatePicker({
    required this.type,
    required this.format,
    required this.onDateSelected,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<KDatePicker> createState() => _KDatePickerState();
}

class _KDatePickerState extends State<KDatePicker> {
  bool selected = false;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (widget.type == SelectorType.day) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ListTile(
                onTap: () => KModal.show(
                  width: 479.0,
                  body: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(100.0),
                      child: KModalNavigation(
                        icon: FluentIcons.arrow_left_24_regular,
                        onTap: () => context.pop(),
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CalendarWidget(
                              type: widget.type,
                              onDateSelected: (date) {
                                setState(() {
                                  _selectedDate = date;
                                });
                                widget.onDateSelected(date);
                              },
                            ),
                            buildBotaoConfirmarData(
                              () => context.pop(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  context: context,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                tileColor: Colors.grey.withOpacity(0.15),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                title: Text(
                  (widget.title == null) ? 'Não definida' : widget.title,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                subtitle: Text(
                  widget.type == SelectorType.day
                      ? DateFormat('dd/MM/yyyy').format(_selectedDate)
                      : DateFormat('MMMM', 'pt_BR').format(_selectedDate),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                trailing: Icon(FluentIcons.edit_24_regular),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ListTile(
                onTap: () => KModal.show(
                  width: 479.0,
                  body: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(100.0),
                      child: KModalNavigation(
                        icon: FluentIcons.dismiss_24_regular,
                        onTap: () => context.pop(),
                      ),
                    ),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 24.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CalendarWidget(
                                    type: widget.type,
                                    onDateSelected: (date) {
                                      setState(() {
                                        _selectedDate = date;
                                      });
                                      widget.onDateSelected(date);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 24.0),
                          child: buildBotaoConfirmarData(
                            () => context.pop(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  context: context,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                tileColor: Colors.grey.withOpacity(0.15),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                title: Text(
                  widget.title,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                subtitle: Text(
                  widget.type == SelectorType.day
                      ? DateFormat('dd/MM/yyyy').format(_selectedDate)
                      : DateFormat('MMMM', 'pt_BR').format(_selectedDate),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                trailing: Icon(FluentIcons.edit_24_regular),
              ),
            );
          }
        },
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  SelectorType type;
  final Function(DateTime) onDateSelected;

  CalendarWidget({Key? key, required this.onDateSelected, required this.type})
      : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();
  bool _showMonthGrid = false;
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  void _changeMonth(int amount) {
    setState(() {
      _selectedDate =
          DateTime(_selectedDate.year, _selectedDate.month + amount);
    });
  }

  List<DateTime> _getDaysInMonth(DateTime month) {
    var firstDay = DateTime(month.year, month.month, 1);
    var days = <DateTime>[];
    var currentDay = firstDay;

    while (currentDay.weekday > DateTime.sunday) {
      days.add(currentDay
          .subtract(Duration(days: currentDay.weekday - DateTime.sunday)));
      currentDay = currentDay.subtract(Duration(days: 1));
    }

    while (currentDay.month == month.month) {
      days.add(currentDay);
      currentDay = currentDay.add(Duration(days: 1));
    }

    while (currentDay.weekday > DateTime.sunday) {
      days.add(currentDay);
      currentDay = currentDay.add(Duration(days: 1));
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    var daysInMonth = _getDaysInMonth(_selectedDate);
    var firstDayOfMonth = daysInMonth.first;
    var offset = firstDayOfMonth.weekday;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _showMonthGrid = !_showMonthGrid;
                });
              },
              child: Text(
                DateFormat('MMMM yyyy', 'pt_BR').format(_selectedDate),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(FluentIcons.chevron_left_24_regular),
                  onPressed: () => _changeMonth(-1),
                ),
                IconButton(
                  icon: Icon(FluentIcons.chevron_right_24_regular),
                  onPressed: () => _changeMonth(1),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.0),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (widget.type == SelectorType.day) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_showMonthGrid)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        var month = DateTime(_selectedDate.year, index + 1);
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: month.month == _selectedDate.month
                                  ? Color(0xFF4B5D4D)
                                  : null,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15.0),
                              onTap: () {
                                setState(() {
                                  _selectedDate = month;
                                  _showMonthGrid = false;
                                });
                              },
                              child: Center(
                                child: Text(
                                  DateFormat('MMMM', 'pt_BR')
                                      .format(month)
                                      .substring(0, 3),
                                  style: TextStyle(
                                    color: month.month == _selectedDate.month
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  if (!_showMonthGrid)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var i = 0; i < 7; i++)
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  [
                                    'Dom',
                                    'Seg',
                                    'Ter',
                                    'Qua',
                                    'Qui',
                                    'Sex',
                                    'Sáb'
                                  ][i],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                          ),
                          itemCount: daysInMonth.length + offset,
                          itemBuilder: (context, index) {
                            if (index < offset) {
                              return Container();
                            } else {
                              var day = daysInMonth[index - offset];
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15.0),
                                  onTap: () {
                                    setState(() {
                                      _selectedDay = day;
                                      _showMonthGrid = false;
                                      widget.onDateSelected(day);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: day.day == _selectedDay.day &&
                                              day.month == _selectedDay.month
                                          ? Color(0xFF4B5D4D)
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${day.day}',
                                        style: TextStyle(
                                          color: day.day == _selectedDay.day &&
                                                  day.month ==
                                                      _selectedDay.month
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      var month = DateTime(_selectedDate.year, index + 1);
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: month.month == _selectedDate.month
                                ? Color(0xFF4B5D4D)
                                : null,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15.0),
                            onTap: () {
                              setState(() {
                                _selectedDate = month;
                                _showMonthGrid = false;
                                widget.onDateSelected(month);
                              });
                            },
                            child: Center(
                              child: Text(
                                DateFormat('MMMM', 'pt_BR')
                                    .format(month)
                                    .substring(0, 3),
                                style: TextStyle(
                                  color: month.month == _selectedDate.month
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

class KModalNavigation extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final VoidCallback? onTap2;

  const KModalNavigation({
    required this.icon,
    required this.onTap,
    this.onTap2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white.withOpacity(0.9),
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey.withOpacity(0.15),
                ),
                width: 48.0,
                height: 48.0,
                child: IconButton(
                  icon: Icon(
                    icon,
                  ),
                  onPressed: onTap,
                ),
              ),
              if (onTap2 != null)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.grey.withOpacity(0.15),
                  ),
                  width: 48.0,
                  height: 48.0,
                  child: IconButton(
                    icon: Icon(
                      FluentIcons.question_24_regular,
                    ),
                    onPressed: onTap2,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBotaoConfirmarData(VoidCallback onTap) {
  return Container(
    child: Button(
      fit: true,
      active: true,
      onTap: onTap,
      title: 'Confirmar data',
      height: 64.0,
      width: 500.0,
      type: ButtonType.elevated,
      color: Color(0xFF4B5D4D),
    ),
  );
}
