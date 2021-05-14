import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
 

class DialogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SimpleDialog(
            
            title: Row(children: [
              Text("Nueva Tarea"),
              Spacer(),
              IconButton(
                icon: Icon(Icons.cancel), 
                onPressed: ()=> Navigator.pop(context)),
            ],),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
            ),
            children: [
                            FormBuilder(
                child: Column(children: [
                            FormBuilderTextField(name: "title",
                            decoration: InputDecoration(
                              hintText: "Add Title",
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(left: 48.0)
                            ),
                            ),
                            Divider(),
                            FormBuilderTextField(name: "description",
                            maxLines: 5,
                            minLines: 1,
                            decoration: 
                            InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add Details",
                              prefixIcon: Icon(Icons.short_text),
                              ),
                              ),
                              Divider(),
                              FormBuilderDateTimePicker(
                                name: "date", 
                                initialValue: DateTime.now(),
                                fieldHintText: "Add Date",
                                inputType: InputType.date,
                                format: DateFormat('EEEE, dd MMMM, yyyy'),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.calendar_today_sharp),
                                )
                                )
                ,

                ],)),
            ],

          )
    );
  }
}