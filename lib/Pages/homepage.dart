import 'package:flutter/material.dart';
import 'package:internship_2/Pages/screen2.dart';
import 'package:internship_2/Util/service_provider.dart';
import 'package:internship_2/model/page_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageData? pageData;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    pageData = await ServiceProvider().getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            //push to second screen
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Screen2(pageData: pageData!)),
            );
          },
          child: Container(
            child: const Center(
                child: Text(
              "Load Data",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            height: 100,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
