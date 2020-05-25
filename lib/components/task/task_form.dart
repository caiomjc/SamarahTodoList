import 'package:flutter/material.dart';
import '../adaptatives/adaptative_button.dart';
import '../adaptatives/adaptative_datepicker.dart';
import '../adaptatives/adaptative_textfield.dart';

class TaskForm extends StatefulWidget {
  final void Function(String, DateTime) onSubmit;

  TaskForm(this.onSubmit);

  @override
  _State createState() => _State();
}

class _State extends State<TaskForm> {
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final description = _descriptionController.text;

    if (description.isEmpty || _selectedDate == null) {
      return;
    }

    widget.onSubmit(description, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                label: 'Descrição',
                controller: _descriptionController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDataPicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButon(
                    label: 'Nova Tarefa',
                    onPressed: _submitForm,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
