import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/users.dart';
import 'package:plant_app/providers/user_provider.dart';
import 'package:plant_app/ui/screens/widgets/user_widget.dart';

class ProfileVer2 extends StatefulWidget {
  const ProfileVer2({super.key});

  @override
  State<ProfileVer2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileVer2> {
  final dio = Dio();
  List userList = [];

  @override
  void initState() {
    super.initState();
    UserProvider.getUser();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("PROFILE"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          FutureBuilder<List<UserModel>>(
            future: UserProvider.getUser(),
            builder: (BuildContext context,
                AsyncSnapshot<List<UserModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('data: ${snapshot.data}');
                return const Text('please waiting...');
              } else {
                final items = snapshot.data;
                print(
                    " FutureBuilder<List<UserModel>> builder ->${snapshot.data != null} ${snapshot.data?.length} $items");
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = snapshot.data![index];
                        print('item: $item');
                        return UserWidget(user: item);
                      }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
