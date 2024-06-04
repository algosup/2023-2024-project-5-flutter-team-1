import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'pages/candidate/languagehomepage.dart';
import 'pages/candidate/redirection.dart';
import 'pages/candidate/loginpage.dart';
import 'pages/candidate/registerpage.dart';
import 'pages/candidate/registerpage2.dart';
import 'pages/candidate/registerpage3.dart';
import 'pages/candidate/homepage.dart';

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
    GoRoute(
      path: "/registerpage3",
      name: "RegisterPage3",
      builder: (BuildContext context, GoRouterState state) => const RegisterPage3(),
    ),
    GoRoute(
      path: "/homepage",
      name: "HomePage",
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    )
  ]
);