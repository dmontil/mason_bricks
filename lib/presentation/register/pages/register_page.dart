import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
const RegisterPage({
super.key,
});


@override
Widget build(BuildContext context) {
return MultiBlocProvider(
providers: [
// TODO: Add BlocProvider(s)
],
child: RegisterView(),
);
}
}

class RegisterView extends StatelessWidget {
const RegisterView({ super.key});


@override
Widget build(BuildContext context) {
return Container();
}
}