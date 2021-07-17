import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/modelClasses/tagData.dart';
import 'package:help_mate/session/tagSession.dart';
import 'package:help_mate/testControllerForAnuj.dart';

class TestForAnuj extends StatefulWidget {
  const TestForAnuj({Key key}) : super(key: key);

  @override
  _TestForAnujState createState() => _TestForAnujState();
}

class _TestForAnujState extends State<TestForAnuj> {


  TestControllerForAnuj controller = TestControllerForAnuj();

  TagSession session = TagSession();

  List tagsList=[];


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    fetchTags();
  }


  fetchTags() async{
    dynamic data = await session.getAllTags();

    if(data == null)
      {
        print("Unable to get data");
      }
    else{
    setState(() {
      tagsList=data;
    });
    }
  }



  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => "Item $i");
    return Scaffold(
      appBar: AppBar(title: Text("Hey"),),
      body:  Container(
        color: Colors.grey[500],
        child: Column(

          children: [
        Expanded(
          child: ListView.builder(
          padding: const EdgeInsets.all(8),
            itemCount: tagsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Center(child: Text('Entry ${tagsList[index]['tagId']}')),
              );
            }
      ),
        ),

            OutlinedButton(
              onPressed: () {
                print('Received click');
                controller.writeTagData();
              },
              child: const Text('Click me to Send Tag Data'),
            ),
            OutlinedButton(
              onPressed: () {
                print('Received click');
                controller.updateTagData();
              },
              child: const Text('Click me to Update Tag Data for 0qnqZleV73ZMcNeDZ6fG id'),
            ),

          ],
        ),
      ),
    );
  }
}
