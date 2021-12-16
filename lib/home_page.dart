import 'package:flutter/material.dart';
import 'package:geos_api/request.dart';
import 'package:geos_api/result_data.dart';

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
    resultData = fetchData("helper", "");
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
                return Text(snapshot.data!.code_result.toString());
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