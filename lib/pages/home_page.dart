import 'package:flutter/material.dart';
import 'package:geos_api/info.dart';
import 'package:geos_api/request.dart';
import 'package:geos_api/result_data.dart';

import 'info_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  late Future<ResultData> resultData;

  @override
  void initState() {
    super.initState();
    resultData = fetchData("helper", "G6bu9Mer3s");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Geos API"),),
      body: Column(
        children: [
          TextField(
            controller: loginController,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          ElevatedButton(onPressed: (){
            resultData = fetchData(loginController.text, passwordController.text);
          }, child: const Text("Login")),

          FutureBuilder<ResultData>(
            future: resultData,
            builder: (context, snapshot){
              if(snapshot.hasData){

                return Column(
                  children: [
                    Text("code_result: " + snapshot.data!.code_result.toString()),
                    Text("Message: " + snapshot.data!.code_msg!.msg.toString()),
                    Text("Custom fields: " + snapshot.data!.code_msg!.custom_fields!.length.toString()),
                    Text("Data: " + snapshot.data!.data.toString()),
                  ],
                );
              } else {
                return const Text("Error");
              }
            },
          )
        ],
      ),
    );
  }

}