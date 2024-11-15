import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/screens/widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 0, top: 30, left: 10, right: 10),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //avatar user
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.primaryColor.withOpacity(.8),
                      width: 5.0,
                    )),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      ExactAssetImage('assets/images/profile_2.jpg'),
                ),
              ),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Text(
                      'Tu',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      child: Image.asset('assets/images/verified.png'),
                    ),
                  ],
                ),
              ),
              //email section
              Text(
                'tu@gmail.com',
                style: TextStyle(
                  color: Constants.blackColor.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      icon: Icons.person,
                      title: "Cá nhân",
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: "Cài đặt",
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: "Thông báo",
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: "FAQs",
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: "Chia sẻ",
                    ),
                    ProfileWidget(
                      icon: Icons.logout,
                      title: "Đăng xuất",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
