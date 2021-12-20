import 'dart:convert';

class ResultData {
  CodeResult? code_result;
  Message? code_msg;
  String? data;

  ResultData(
      {this.code_result, this.code_msg, this.data});

  factory ResultData.fromJson(String source) => ResultData.fromMap(json.decode(source));

  factory ResultData.fromMap(Map<String, dynamic> map){
    return ResultData(code_result: CodeResult.fromMap(map['code_result'])/*, code_msg: map['code_msg'] != null ? Message.fromMap(map['code_msg']) : null, data: map['data']*/);
  }
}

class CodeResult{
  String? key;
  int? value;

  CodeResult({this.key, this.value});

  factory CodeResult.fromMap(Map<String, dynamic> map){
    return CodeResult(
      key: map['key'],
      value: map['value']
    );
  }
}

class Message {
  String? msg;
  List<String>? custom_fields;
Message({this.msg, this.custom_fields});

  factory Message.fromMap(Map<String, dynamic> map){
    return Message(
      msg: map['msg'],
        custom_fields: map['custom_fields']
    );
  }
}
