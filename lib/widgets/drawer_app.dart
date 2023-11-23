import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/models/item_drawer_model.dart';
import 'package:test_bloc/screens/login_screen.dart';
import 'package:test_bloc/widgets/item_drawer.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginBloc blocRead = context.read<LoginBloc>();

    final List<ItemDrawerModel> itemDrawers = [
      ItemDrawerModel(icon: Icons.group, onPressed: () {}, title: 'New Group'),
      ItemDrawerModel(
          icon: Icons.wifi_channel, onPressed: () {}, title: 'New Channel'),
      ItemDrawerModel(
          icon: Icons.contact_emergency, onPressed: () {}, title: 'Contacts'),
      ItemDrawerModel(icon: Icons.call, onPressed: () {}, title: 'Contacts'),
      ItemDrawerModel(icon: Icons.settings, onPressed: () {}, title: 'Setting'),
      ItemDrawerModel(
          icon: Icons.logout,
          onPressed: () {
            blocRead.add(Logout());
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          title: 'Logout'),
    ];

    return Drawer(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: MediaQuery.of(context).size.height * 0.3,
          color: const Color(0xFF83A2FF),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/avatar.jpg'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thanh Xuân',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    '0987654321',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: itemDrawers.length,
          itemBuilder: (context, index) {
            return ItemDrawer(
              onPressed: itemDrawers[index].onPressed,
              icon: itemDrawers[index].icon,
              textButton: itemDrawers[index].title,
            );
          },
        ))
      ]),
    );
  }
}
