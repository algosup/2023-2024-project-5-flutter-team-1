import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'pages/languagehomepage.dart';
import 'pages/redirection.dart';
import 'pages/loginpage.dart';
import 'pages/registerpage.dart';
import 'pages/registerpage2.dart';

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
      builder: (BuildContext context, GoRouterState state) => LoginPage(storage: DataClass()),
    ),
    GoRoute(
      path: "/registerpage",
      name: "RegisterPage",
      builder: (BuildContext context, GoRouterState state) => const RegisterPage(),
    ),
    GoRoute(
      path: "/registerpage2",
      name: "RegisterPage2",
      builder: (BuildContext context, GoRouterState state) => const RegisterPage2(),
    ),
  ]
);