

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mrplan/theme/colors/light_colors.dart';
import 'package:mrplan/widgets/back_button.dart';
import 'package:mrplan/widgets/task_container.dart';
import 'dart:io';

import 'package:table_calendar/table_calendar.dart';
CalendarController calendarcontrollera = CalendarController();
class CalendarPage extends StatefulWidget {
    final DateTime selectedDate;

  const CalendarPage({Key key, this.selectedDate}) : super(key: key);
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

  int _currentIndex = 0;
  int newIndex = 100+_currentIndex-99;
  RouteSettings routeSettings = routeSettings.arguments;
  
  


class _CalendarPageState extends State<CalendarPage> {
  

  PageController pageController = PageController(initialPage: _currentIndex,
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
final _formkey = GlobalKey<FormBuilderState>();
    Intl.defaultLocale = "es_ES";
    var now = new DateTime.now();
    var formatter1 = new DateFormat.yMMMM();
    var formatter2 = new DateFormat.EEEE().addPattern(',').add_d();
    // var formatter3 = new DateFormat.M();
    String formattedDate = formatter1.format(now);
    String formattedDate2 = formatter2.format(now);
    stdout.writeln("Enter month number");
    List<DateTime> markedDates = [
    DateTime.now().add(Duration(days:_currentIndex))
  ];
    

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
       Navigator.pushNamed(context, 'dialogo',
       arguments: calendarcontrollera.selectedDay);
       
       },
      ),
      
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
              CalendarPage1(),

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

class CalendarPage1 extends StatefulWidget {
  @override
  _CalendarPage1State createState() => _CalendarPage1State();
}

class _CalendarPage1State extends State<CalendarPage1> {

   Widget build(BuildContext context) {
     
      return Center(
            child: Container(
              child: 
              SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  calendarController: calendarcontrollera,
                  availableCalendarFormats: const{
                    CalendarFormat.month: 'mes',
                    CalendarFormat.week: 'semana',
                    CalendarFormat.twoWeeks: 'dos semanas'
                  },
                  initialCalendarFormat: CalendarFormat.week,
                  calendarStyle: CalendarStyle(
                    todayColor: Colors.blue[800],
                    selectedColor: Colors.grey,
                    todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    )
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    formatButtonPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    formatButtonTextStyle: TextStyle(
                      locale: Locale('fr', 'CH')
                    ),
                    centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                    ),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onDaySelected: (date, events, eventos){
                      print(date.toIso8601String());
                    },
                    builders: CalendarBuilders(
                      selectedDayBuilder: (context,date, events) => 
                      Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,),
                        child: Text
                        (date.day.toString(), style: TextStyle(
                          color: Colors.white
                        )),
                        


                      ),
                      todayDayBuilder: (context, date, events)=>
                      Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,),
                        child: Text
                        (date.day.toString(), style: TextStyle(
                          color: Colors.white
                        )),
                    ),
                  
                ),
    ),
              )
              
              ,]
              )
              )
              
              )
              );
            
          
        
      
    }
    
  }
   
          
        