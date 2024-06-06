
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seproject/dataController.dart';

class scoreControl extends StatefulWidget {
  @override
  _scoreControlState createState() => _scoreControlState();
}

class _scoreControlState extends State<scoreControl>{
  final myController = Get.put(DataController());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('성적 관리'),
      ),
      body: ListView.builder(
          itemCount: myController.users[myController.selectedUser.value].courses.length,
          itemBuilder: (context, index){
        return ListTile(
          title: Text(myController.users[myController.selectedUser.value].courses[index]),
          trailing: Text('100'),
          onTap:  () {
            
    }
        );
      },)
    );
  }
}