import 'package:flutter/material.dart';
import 'package:plant_app/models/users.dart';

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: Icons.person_3_rounded,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: Icons.dock,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: Icons.list_alt,
    buttonText: "Add",
  ),
];

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Activity",
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: Icons.notifications_active,
  ),
  CustomListTile(
    title: "Logout",
    icon: Icons.arrow_circle_left,
  ),
];
