import 'package:beamer/beamer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:socialme/src/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:socialme/src/features/authentication/presentation/widgets/indicator_button_widget.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/signin';
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in")),
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
            RichText(
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey),
                    children: [
                  const TextSpan(text: 'Don\'t have an account? '),
                  TextSpan(
                      text: 'Create an account',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.blueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => context.beamToNamed(SignUpPage.routeName))
                ])),
            const SizedBox(height: 12),
            const IndicatorButtonWidget(label: 'Sign In'),
          ],
        ),
      ),
    );
  }
}
