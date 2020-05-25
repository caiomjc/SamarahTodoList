import 'package:flutter/material.dart';

class TaskEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.only(
        top: 10,
      ),
      child: Text(
        'Nenhuma Tarefa Cadastrada!',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
