import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'pages/languagehomepage.dart';
import 'pages/redirection.dart';
import 'pages/loginpage.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: "/languagehomepage",
      name: "LanguageHomePage",
      // ignore: prefer_const_constructors
      builder: (BuildContext context, GoRouterState state) => LanguageHomePage(storage: GetUserData()),
    ),
    GoRoute(
      path: "/",
      name: "RedirectionPage",
      builder: (BuildContext context, GoRouterState state) => RedirectionPage(storage: DocumentStorage()),
    ),
    GoRoute(
      path: "/loginpage",
      name: "LoginPage",
      builder: (BuildContext context, GoRouterState state) => const MyWidget(),
    )
  ]
);