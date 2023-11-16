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
            child: ListView.builder(
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
