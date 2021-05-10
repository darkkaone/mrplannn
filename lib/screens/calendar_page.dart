

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mrplan/src/pages/labs/calendrar_strip.dart';
import 'package:mrplan/theme/colors/light_colors.dart';
import 'package:mrplan/widgets/back_button.dart';
import 'package:mrplan/widgets/task_container.dart';
import 'dart:io';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

  int _currentIndex = 0;
  int newIndex = 100+_currentIndex-99;

class _CalendarPageState extends State<CalendarPage> {
  

  );
@override
void initState() { 
  super.initState();
  initializeDateFormatting();
}

@override
void dispose(){
  pageController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {

    Intl.defaultLocale = "es_ES";
    var now = new DateTime.now();
    var formatter1 = new DateFormat.yMMMM();
    var formatter2 = new DateFormat.EEEE().addPattern(',').add_d();
    // var formatter3 = new DateFormat.M();
    String formattedDate = formatter1.format(now);
    String formattedDate2 = formatter2.format(now);
    // String mes = formatter3.format(now);
    // String dias = DateFormat.E().format(now);
    stdout.writeln("Enter month number");
    // DateTime selectedvalue = DateTime.now();
    List<DateTime> markedDates = [
    // DateTime.now().subtract(Duration(days: _currentIndex)),
    // DateTime.now().subtract(Duration(days: _currentIndex)),
    DateTime.now().add(Duration(days:_currentIndex))
  ];
    

    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              
              MyBackButton(),
              SizedBox(height: 30.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      formattedDate2,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                    
                  ]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Un día productivo!',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  formattedDate,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              SizedBox(height: 20.0),
              
             CalendarStrip(
               startDate: DateTime.now(),
               endDate: DateTime.now().add(Duration(days: 365)),
               dateTileBuilder: dateTileBuilder,
               iconColor: Colors.black87,
               monthNameWidget: monthNameWidget,
               markedDates: markedDates,
               containerDecoration: BoxDecoration(color: Colors.white70),
                onDateSelected: onselected,
                onWeekSelected: onWeekSelect,
             ),
             
BottomNavigationBar(
  currentIndex: _currentIndex,
  
  items:[
  BottomNavigationBarItem(
  icon: Icon(Icons.add),
  label: 'a'
),

BottomNavigationBarItem(
  icon: Icon(Icons.add),
  label: 'a'
),

BottomNavigationBarItem(
  icon: Icon(Icons.add),
  label: 'a'
),



],

onTap: (index){
  pageController.animateToPage(index, duration: (Duration(milliseconds: 500)), curve: Curves.ease);
},
),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      
                      
                      Expanded(
                        flex: 1,
                        child: PageView.builder(
                          controller: pageController,
                          onPageChanged: (index) {
                            if(index != null)
                            return Text('hallo');
                            else
          setState(() {
            index = _currentIndex;

          });
        
  },
                          
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, position) {
                            return
                            ListView(
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                TaskContainer(
                                  title: 'Project Research',
                                  subtitle:
                                      'Discuss with the colleagues about the future plan',
                                  boxColor: LightColors.kLightYellow2,
                                ),
                                TaskContainer(
                                  title: 'Work on Medical App',
                                  subtitle: 'Add medicine tab',
                                  boxColor: LightColors.kLavender,
                                ),
                                TaskContainer(
                                  title: 'Call',
                                  subtitle: 'Call to david',
                                  boxColor: LightColors.kPalePink,
                                ),
                                TaskContainer(
                                  title: 'Design Meeting',
                                  subtitle:
                                      'Discuss with designers for new task for the medical app',
                                  boxColor: LightColors.kLightGreen,
                                ),
                              ],
                            );
                    
                          }
                          
                        ),
                      )
                    ],
                  )
                )
              )
    ]))));
                    
  }
}

dateTileBuilder(date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(), style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  monthNameWidget(monthName) {
    return Container(
      child: Text(monthName,
          style:
              TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87, fontStyle: FontStyle.italic)),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }
  
  onWeekSelect(data) {
    print("Selected week starting at -> $data");
  }

  onselected(index){
    final pageController = PageController(initialPage: _currentIndex);

  pageController.animateToPage(newIndex, duration: (Duration(milliseconds: 500)), curve: Curves.ease);

            newIndex = _currentIndex;
  }