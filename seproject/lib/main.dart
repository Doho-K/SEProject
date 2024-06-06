import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seproject/dataController.dart';
import 'package:seproject/scoreControl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedRole = '김교수';
  final myController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('성적 시스템'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '사용자를 선택하세요:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedRole,
              items: <String>['김교수', '박조교', '이학생'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue!;
                  if(newValue == '김교수'){
                    myController.changeRole(0);
                  }
                  else if(newValue == '박조교'){
                    myController.changeRole(1);
                  }
                  else if(newValue == '이학생'){
                    myController.changeRole(2);
                  }

                });
              },
            ),
            SizedBox(height: 20),
            Text(
              '선택된 역할: $_selectedRole',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              if(myController.users[myController.selectedUser.value].role == '학생'){
                //Show push message on screen
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content: Text("학생은 성적 조회만 가능합니다."),
                  );
                });
              }
              else{
                  Get.to(scoreControl());
              }
            }, child: Text("성적 관리")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              if(myController.users[myController.selectedUser.value].role == '교수'){

              }
              else{
                //Show push message on screen
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content: Text("정책 설정은 교수만 가능합니다."),
                  );
                });
              }

            }, child: Text("정책 설정")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){


            }, child: Text("성적 조회")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              if(myController.users[myController.selectedUser.value].role == '교수'){

              }
              else if(myController.users[myController.selectedUser.value].role == '학생'){

              }

            }, child: Text("이의 신청")),
          ],
        ),
      ),
    );
  }
}
