import 'package:flutter/material.dart';
import 'package:restorable/profession_screen.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> with RestorationMixin {
  final RestorableBool _restorableBool = RestorableBool(true);
  final RestorableTextEditingController _restorableTextEditingController =
      RestorableTextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Restoration')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                controller: _restorableTextEditingController.value,
              ),
              Row(
                children: [
                  const Text('Is Developer'),
                  Checkbox(
                    value: _restorableBool.value,
                    onChanged: (bool? value) {
                      if (value == null) return;
                      setState(() {
                        _restorableBool.value = value;
                      });
                    },
                  ),
                ],
              ),
              TextButton(onPressed: _onPressed, child: const Text('Next'))
            ],
          ),
        ));
  }

  static Route<void> _a(context, args) {
    return MaterialPageRoute(builder: (context) => const ProfessionScreen());
  }

  void _onPressed() {
    Navigator.of(context).restorablePush((_a));
  }

  @override
  String? get restorationId => 'name_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_restorableBool, 'name');
    registerForRestoration(_restorableTextEditingController, 'is_developer');
  }
}
