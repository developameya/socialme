import 'package:flutter/material.dart';
import 'package:socialme/src/features/authentication/presentation/widgets/indicator_button_widget.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = 'sign_up_page';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Social Me!",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                // controller: textFieldController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  // errorText: errorText,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                // onTapOutside: (_) => onTapOutside(textFieldController),
                // onChanged: onChanged,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                autocorrect: false,
                // keyboardType: TextInputType.,
                // controller: textFieldController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  // errorText: errorText,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                // onTapOutside: (_) => onTapOutside(textFieldController),
                // onChanged: onChanged,
              ),
            ),
            const IndicatorButtonWidget(label: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
