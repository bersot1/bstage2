import 'package:bstage2/main/factories/pages/splash/splash_bloc_factory.dart';
import 'package:bstage2/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

Widget makeSplashPage() => SplashPage(bloc: makeSplashPageBloc());
