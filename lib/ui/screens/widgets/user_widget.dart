import 'package:flutter/material.dart';
import 'package:plant_app/common/user.dart';
import 'package:plant_app/models/users.dart';

class UserWidget extends StatelessWidget {
  final UserModel user;
  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // print('user name: ${user.email}');
    final profileCards = profileCompletionCards;
    final customList = customListTiles;

    // return Text('name: ${user.email}');
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              '${user.avatar}',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '- ${user.firstName}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Complete your profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                " - ${user.lastName}",
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
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

    // return Column(
    //   children: [
    //     const CircleAvatar(
    //       radius: 50,
    //       backgroundImage: NetworkImage(
    //         "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
    //       ),
    //     ),
    //     const SizedBox(height: 10),
    //     const Text(
    //       "Rachael Wagner",
    //       style: TextStyle(
    //         fontSize: 18,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     const SizedBox(height: 25),
    //     const Row(
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.only(right: 5),
    //           child: Text(
    //             "Complete your profile",
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //         Text(
    //           "(1/5)",
    //           style: TextStyle(
    //             color: Colors.blue,
    //           ),
    //         )
    //       ],
    //     ),
    //     const SizedBox(height: 10),
    //     Row(
    //       children: List.generate(5, (index) {
    //         return Expanded(
    //           child: Container(
    //             height: 7,
    //             margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10),
    //               color: index == 0 ? Colors.blue : Colors.black12,
    //             ),
    //           ),
    //         );
    //       }),
    //     ),
    //     const SizedBox(height: 10),
    //     SizedBox(
    //       height: 180,
    //       child: ListView.separated(
    //         physics: const BouncingScrollPhysics(),
    //         scrollDirection: Axis.horizontal,
    //         itemBuilder: (context, index) {
    //           final card = profileCompletionCards[index];
    //           return SizedBox(
    //             width: 160,
    //             child: Card(
    //               shadowColor: Colors.black12,
    //               child: Padding(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Column(
    //                   children: [
    //                     Icon(
    //                       card.icon,
    //                       size: 30,
    //                     ),
    //                     const SizedBox(height: 10),
    //                     Text(
    //                       card.title,
    //                       textAlign: TextAlign.center,
    //                     ),
    //                     const Spacer(),
    //                     ElevatedButton(
    //                       onPressed: () {},
    //                       style: ElevatedButton.styleFrom(
    //                         elevation: 0,
    //                         shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(10)),
    //                       ),
    //                       child: Text(card.buttonText),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           );
    //         },
    //         separatorBuilder: (context, index) =>
    //             const Padding(padding: EdgeInsets.only(right: 5)),
    //         itemCount: profileCards.length,
    //       ),
    //     ),
    //     const SizedBox(height: 35),
    //     ...List.generate(
    //       customList.length,
    //       (index) {
    //         final tile = customList[index];
    //         return Padding(
    //           padding: const EdgeInsets.only(bottom: 5),
    //           child: Card(
    //             elevation: 4,
    //             shadowColor: Colors.black12,
    //             child: ListTile(
    //               leading: Icon(tile.icon),
    //               title: Text(tile.title),
    //               trailing: const Icon(Icons.chevron_right),
    //             ),
    //           ),
    //         );
    //       },
    //     )
    //   ],
    // );
  }
}
