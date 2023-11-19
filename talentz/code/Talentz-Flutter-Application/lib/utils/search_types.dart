import 'package:flutter/material.dart' show Icons;
import 'package:talentz/constants/app_routes.dart';

const searchTypes = [
  {
    "name": "Name",
    "icon": Icons.person_rounded,
    "route": listViewRoute,
  },
  {
    "name": "Skills",
    "icon": Icons.lightbulb_rounded,
    "route": listViewRoute,
  },
  {
    "name": "Location",
    "icon": Icons.location_city_rounded,
    "route": listViewRoute,
  },
  {
    "name": "Category",
    "icon": Icons.category_rounded,
    "route": listViewRoute,
  },
];
