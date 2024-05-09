import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/service/database.dart';
import 'package:random_string/random_string.dart';

class records extends StatefulWidget {
  const records({super.key});

  @override
  State<records> createState() => _recordsState();
}

class _recordsState extends State<records> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController cloriescontroller = new TextEditingController();
  TextEditingController datecontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Records",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Records",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Calories",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: cloriescontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Date",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: datecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    String Id = randomAlphaNumeric(10);
                    Map<String, dynamic> recordsInfoMap = {
                      "Name": namecontroller,
                      "Calories": cloriescontroller,
                      "Date": datecontroller.text,
                    };
                    await DatabaseMethods()
                        .addrecordsDetails(recordsInfoMap, Id)
                        .then((value) {});
                  },
                  child: Text(
                    "Add",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
