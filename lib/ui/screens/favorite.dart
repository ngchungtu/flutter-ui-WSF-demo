import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/providers/favorites_provider.dart';
import 'package:plant_app/providers/sample_provider.dart';
import 'package:plant_app/ui/screens/widgets/plant_widget.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Plant> favoritedPLants_onParmas;
  const FavoriteScreen({super.key, required this.favoritedPLants_onParmas});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // with AutomaticKeepAliveClientMixin {
  // @override
  // bool wantKeepAlive = true;

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    Size size = MediaQuery.of(context).size;
    // print('context isFavor:${context.watch<FavoriteProvider>().isFavorated}');
    return Scaffold(
      body: widget.favoritedPLants_onParmas.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Oops!....Yêu thích trống",
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                  Text("check data from provider"),
                  Text(
                    context.watch<ChangeText>().defaultText.toString(),
                  ),
                ],
              ),
            )
          : Container(
              //list get fav items
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .5,
              child: ListView.builder(
                itemCount: widget.favoritedPLants_onParmas.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext ctx, int index) {
                  return PlantWidget(
                      index: index, plantList: widget.favoritedPLants_onParmas);
                },
              ),
            ),
    );
  }
}
