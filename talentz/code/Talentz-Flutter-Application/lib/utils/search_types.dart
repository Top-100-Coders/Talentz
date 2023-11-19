import 'package:flutter/material.dart' show Icons;
import 'package:talentz/screens/home/list_screen.dart';
import 'package:talentz/utils/enums.dart';

const searchTypes = [
  {
    "name": "Name",
    "icon": Icons.person_rounded,
    "route": ListViewScreen.routeName,
    "searchType": SearchType.name,
  },
  {
    "name": "Skills",
    "icon": Icons.lightbulb_rounded,
    "route": ListViewScreen.routeName,
    "searchType": SearchType.skill,
  },
  {
    "name": "Location",
    "icon": Icons.location_city_rounded,
    "route": ListViewScreen.routeName,
    "searchType": SearchType.location,
  },
  {
    "name": "Category",
    "icon": Icons.category_rounded,
    "route": ListViewScreen.routeName,
    "searchType": SearchType.category,
  },
];
