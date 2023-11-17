import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/config/save_data.dart';
import 'package:test_bloc/widgets/alert_dialog_note.dart';
import 'package:test_bloc/widgets/drawer_app.dart';
import 'package:test_bloc/widgets/item_note.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String userName = '';
  String password = '';

  void _getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      userName = sharedPreferences.getString(SaveData.saveUserName) ?? '';
      password = sharedPreferences.getString(SaveData.savePassword) ?? '';
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            AlertDialogNote(
              context: context,
              content: '',
              title: 'Thêm ghi chú',
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        drawer: const DrawerApp(),
        appBar: AppBar(
          title: const Text('Danh sách ghi chú'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemNote(),
            ],
          ),
        ),
      ),
    );
  }
}
