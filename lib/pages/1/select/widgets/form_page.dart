import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../index.dart';
import 'index.dart';

class SelectFormPage extends GetView<StatelessWidget> {
  SelectFormPage({
    Key? key,
    this.ctrl,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final SelectController? ctrl;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: kDefaultPadding * 15),
              SelectForm(formKey: _formKey, state: ctrl!.state),
              SizedBox(height: kDefaultPadding * 1),
              SizedBox(
                child: RoundedFormButton(
                  height: 0.06,
                  fontSize: 6,
                  color: Color.fromARGB(255, 115, 115, 115),
                  textColor: Colors.white70,
                  fontWeight: FontWeight.bold,
                  label: "Send",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ctrl!.onSelect(context, ctrl!.state.email);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
