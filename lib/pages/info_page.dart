import 'package:flutter/cupertino.dart';

import '../info.dart';

class InfoPage extends StatelessWidget{
  InfoPage({required this.info});
  Info info;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(info.worker_id.toString())
      ],
    );
  }

}