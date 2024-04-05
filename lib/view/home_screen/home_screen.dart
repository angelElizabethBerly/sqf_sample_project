// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqf_sample_project/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await HomeScreenController.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await HomeScreenController.addData();
          setState(() {});
        },
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await HomeScreenController.getAllData();
                  setState(() {});
                },
                child: Text("get")),
            Column(
                children: List.generate(
                    HomeScreenController.data.length,
                    (index) => ListTile(
                          title: Text(
                              HomeScreenController.studentList[index].name),
                          subtitle: Text(HomeScreenController
                              .studentList[index].ph
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await HomeScreenController.updateData(
                                        HomeScreenController
                                            .studentList[index].id);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () async {
                                    await HomeScreenController.deleteData(
                                        HomeScreenController
                                            .studentList[index].id);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        )))
          ],
        ),
      ),
    );
  }
}
