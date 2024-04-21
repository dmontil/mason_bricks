import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class {{name.pascalCase()}}Page extends StatelessWidget {
const {{name.pascalCase()}}Page({
super.key,
});


@override
Widget build(BuildContext context) {
return MultiBlocProvider(
providers: [
// TODO: Add BlocProvider(s)
],
child: {{name.pascalCase()}}View(),
);
}
}

class {{name.pascalCase()}}View extends StatelessWidget {
const {{name.pascalCase()}}View({ super.key});


@override
Widget build(BuildContext context) {
return Container();
}
}