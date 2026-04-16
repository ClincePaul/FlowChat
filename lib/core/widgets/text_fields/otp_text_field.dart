
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;
  final List<TextInputFormatter>? inputFormatters;
  final double? fontSize;
  final FocusNode? focusnode;

  const OtpTextField({
    super.key,
    this.length = 5,
    required this.onCompleted,
    this.inputFormatters,
    this.fontSize,
    this.focusnode,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(widget.length, (_) => TextEditingController());

    focusNodes = List.generate(widget.length, (index) {
      if (index == 0 && widget.focusnode != null) {
        return widget.focusnode!;
      }
      return FocusNode();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (focusNodes.isNotEmpty) {
        focusNodes[0].requestFocus();
      }
    });
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }

    for (var i = 0; i < focusNodes.length; i++) {
      if (i == 0 && widget.focusnode != null) continue;
      focusNodes[i].dispose();
    }

    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        focusNodes[index + 1].requestFocus();
      }
    } 
    else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }

    final otp = controllers.map((c) => c.text).join();

    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 45,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: widget.fontSize != null
                ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: widget.fontSize,
                  )
                : Theme.of(context).textTheme.headlineLarge,
            inputFormatters: widget.inputFormatters ??
                [FilteringTextInputFormatter.digitsOnly],
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: "",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}