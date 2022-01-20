import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../info.dart';

class Item{
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(Info info) {
  List<Item>? resultList = [];
  resultList.add(Item(expandedValue: info.worker_id, headerValue: "worker_id"));
  resultList.add(Item(expandedValue: info.worker_group_id, headerValue: "worker_group_id"));
  resultList.add(Item(expandedValue: info.user_business_id, headerValue: "user_business_id"));
  resultList.add(Item(expandedValue: info.firstname.toString(), headerValue: "firstname"));
  resultList.add(Item(expandedValue: info.lastname.toString(), headerValue: "lastname"));
  resultList.add(Item(expandedValue: info.patronymic.toString(), headerValue: "patronymic"));
  resultList.add(Item(expandedValue: info.initials.toString(), headerValue: "initials"));
  resultList.add(Item(expandedValue: info.email.toString(), headerValue: "email"));
  resultList.add(Item(expandedValue: info.telephone.toString(), headerValue: "telephone"));
  resultList.add(Item(expandedValue: info.date_added.toString(), headerValue: "date_added"));
  resultList.add(Item(expandedValue: info.date_modified.toString(), headerValue: "date_modified"));
  resultList.add(Item(expandedValue: info.post.toString(), headerValue: "post"));

  return resultList;
}


class InfoPage extends StatelessWidget{
  InfoPage({Key? key, required this.info}) : super(key: key);
  Info info;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Full Info",
      home: Scaffold(
        appBar: AppBar(),
        body: InfoPageAccordion(info),
      ),
    );
  }

}

class InfoPageAccordion extends StatefulWidget{
  late Info _info;
  InfoPageAccordion(Info info, {Key? key}) : super(key: key){
    _info = info;
  }

  @override
  State<InfoPageAccordion> createState() => _InfoPageState(_info);

}

class _InfoPageState extends State<InfoPageAccordion>{

  late Info _info;
  late final List<Item> _data;
  _InfoPageState(Info info){
    _info = info;
    _data = generateItems(_info);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }
  Widget _buildPanel(){
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });

        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(headerBuilder:
              (BuildContext context, bool isExpanded){
            return ListTile(
              title: Text(item.headerValue),
            );
          }, body: ListTile(title: Text(item.expandedValue)), isExpanded: item.isExpanded);
        }).toList()
    );
  }
}