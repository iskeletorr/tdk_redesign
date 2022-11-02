import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  DateTime? date;
  Color? color;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date == null ? 'Nothing picked' : date.toString()),
          TextButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: date ?? DateTime.now(),
                  firstDate: DateTime.utc(2022),
                  lastDate: DateTime.utc(2023),
                ).then((value) => setState(
                      () {
                        if (value != null) date = value;
                      },
                    ));
              },
              child: Text('Pick a date')),
          Container(
            height: 100,
            color: color ?? Colors.transparent,
          ),
          TextButton(
              onPressed: () async {
                var result = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text('Select a color'),
                      children: [
                        SimpleDialogOption(
                          child: Text('Red'),
                          onPressed: () {
                            setState(() {
                              color = Colors.red;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        SimpleDialogOption(
                          child: Text('Green'),
                          onPressed: () {
                            setState(() {
                              color = Colors.green;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        SimpleDialogOption(
                          child: Text('Blue'),
                          onPressed: () {
                            setState(() {
                              color = Colors.blue;
                            });
                            Navigator.pop(context, true);
                          },
                        ),
                      ],
                    );
                  },
                );
                print(result);
              },
              child: Text('Pick a color')),
        ],
      ),
    );
  }
}
