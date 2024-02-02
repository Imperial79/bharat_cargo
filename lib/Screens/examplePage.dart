import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

ValueNotifier<bool> isRedirect = ValueNotifier(true);

class ExamplePage extends StatefulWidget {
  final GoRouterState state;
  const ExamplePage({super.key, required this.state});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  void initState() {
    super.initState();
    isRedirect.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.state.path.toString()),
            Text(widget.state.pathParameters.toString()),
          ],
        ),
      ),
    );
  }
}
