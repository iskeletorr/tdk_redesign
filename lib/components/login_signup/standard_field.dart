import 'package:flutter/material.dart';

class StandardField extends StatefulWidget {
  const StandardField({super.key, required this.controller, required this.hintText, required this.field});
  final TextEditingController controller;
  final String hintText;
  final String field;

  @override
  State<StandardField> createState() => _StandardFieldState();
}

class _StandardFieldState extends State<StandardField> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.field,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(192, 0, 0, 0),
            )),
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(
                hintText: widget.hintText,
                suffix: Visibility(
                  visible: widget.field.contains('Password') ? true : false,
                  child: IconButton(
                      onPressed: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_red_eye)),
                )),
            obscureText: obscure,
            controller: widget.controller,
            validator: (val) => val!.isEmpty ? "${widget.field} can't be empty" : null,
            onSaved: (val) {
              widget.controller.text = val.toString();
            },
          ),
        ),
      ],
    );
  }
}
