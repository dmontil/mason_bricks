import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TestingPage extends StatelessWidget {
const TestingPage({
super.key,
});


@override
Widget build(BuildContext context) {
return MultiBlocProvider(
providers: [
// TODO: Add BlocProvider(s)
],
child: TestingView(),
);
}
}

class TestingView extends StatelessWidget {
const TestingView({ super.key});


@override
Widget build(BuildContext context) {
return Container();
}
}