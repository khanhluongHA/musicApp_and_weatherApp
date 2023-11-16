import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/login_bloc.dart';
import 'package:test_bloc/screens/login_screen.dart';
import 'package:test_bloc/widgets/item_drawer.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginBloc blocRead = context.read<LoginBloc>();
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 230,
            color: Colors.green,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://ss-images.saostar.vn/wwebp700/2018/06/10/2968571/34689401_2147325555551794_7654281988110548992_n.jpg'))),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Xin chào:  meomeo',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '0987654321',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              ItemDrawer(
                textButton: 'New Group',
                icon: Icons.group,
                onPressed: () {},
              ),
              ItemDrawer(
                textButton: 'New Channel',
                icon: Icons.wifi_channel,
                onPressed: () {},
              ),
              ItemDrawer(
                textButton: 'Contacts',
                icon: Icons.contact_emergency,
                onPressed: () {},
              ),
              ItemDrawer(
                textButton: 'Calls',
                icon: Icons.call,
                onPressed: () {},
              ),
              ItemDrawer(
                textButton: 'Setting',
                icon: Icons.settings,
                onPressed: () {},
              ),
              ItemDrawer(
                textButton: 'Logout',
                icon: Icons.logout,
                onPressed: () {
                  blocRead.add(Logout());
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
