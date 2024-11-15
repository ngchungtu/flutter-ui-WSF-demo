import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_app/common/user.dart';
import 'package:plant_app/models/users.dart';
import 'package:plant_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileVer2 extends StatefulWidget {
  const ProfileVer2({super.key});

  @override
  State<ProfileVer2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileVer2> {
  final dio = Dio();
  List userList = [];

  // void getUser() async {
  //   try {
  //     var res =
  //         await Dio().get('https://jsonplaceholder.typicode.com/users?id=1');
  //     setState(() {
  //       userList = res.data;
  //     });
  //     userList = res.data;
  //     print('res: $res');
  //     print('userLisst: $userList');
  //   } catch (e) {
  //     print('Error getting');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    UserProvider.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final profileCards = profileCompletionCards;
    final customList = customListTiles;

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
          // FutureBuilder<List<UserModel>>(
          //   future: UserProvider.getUser(),
          //   builder: (BuildContext context,
          //       AsyncSnapshot<List<UserModel>> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Text('please waiting...');
          //     } else if (snapshot.hasError) {
          //       return Text('Error: ${snapshot.error}');
          //     } else {
          //       return ListView.builder(
          //           itemCount: snapshot.data!.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             final item = snapshot.data![index];
          //             return Card(
          //               child: ListTile(
          //                 title: Text(item.name),
          //                 subtitle: Text(item.email),
          //               ),
          //             );
          //           });
          //       // return const Column(
          //       //   children: [
          //       //     CircleAvatar(
          //       //       radius: 50,
          //       //       backgroundImage: NetworkImage(
          //       //         "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
          //       //       ),
          //       //     ),
          //       //     SizedBox(height: 10),
          //       //     Text(
          //       //       "Rachael Wagner",
          //       //       style: TextStyle(
          //       //         fontSize: 18,
          //       //         fontWeight: FontWeight.bold,
          //       //       ),
          //       //     ),
          //       //     // Text("Junior Product Designer")
          //       //   ],
          //       // );
          //     }
          //   },
          // ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Complete your profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "(1/5)",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: List.generate(5, (index) {
              return Expanded(
                child: Container(
                  height: 7,
                  margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ? Colors.blue : Colors.black12,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    shadowColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(
                            card.icon,
                            size: 30,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            card.title,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text(card.buttonText),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCards.length,
            ),
          ),
          const SizedBox(height: 35),
          ...List.generate(
            customList.length,
            (index) {
              final tile = customList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: ListTile(
                    leading: Icon(tile.icon),
                    title: Text(tile.title),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
