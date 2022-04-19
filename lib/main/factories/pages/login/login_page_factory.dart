import 'package:bstage2/main/factories/pages/login/login_bloc_factory.dart';
import 'package:bstage2/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';

Widget makeLoginPage() => LoginPage(bloc: makeLoginBloc());
