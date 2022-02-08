import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        //title: const Text('Splash'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: VakinhaTestFormfield(
              label: 'Text Form',
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          VakinhaButton(
            label: 'Entrar',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

//atalho fu-stl
