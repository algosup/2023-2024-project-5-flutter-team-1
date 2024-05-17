import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'pages/languagehomepage.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: "LanguageHomePage",
      // ignore: prefer_const_constructors
      builder: (BuildContext context, GoRouterState state) => LanguageHomePage(),
    )
  ]
);