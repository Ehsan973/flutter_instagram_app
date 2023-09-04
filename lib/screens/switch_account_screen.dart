import 'dart:ui';

import 'package:flutter/material.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/switch_account_background.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 44),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 300,
                              height: 340,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromRGBO(255, 255, 255, 0.5),
                                      Color.fromRGBO(255, 255, 255, 0.2),
                                    ]),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 32,
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/profile.png'),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'AmirAhmadAdibi',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 46,
                                    width: 129,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Confirm'),
                                        style: Theme.of(context)
                                            .elevatedButtonTheme
                                            .style),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Text(
                                    'Switch Account',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 50,
                  top: 132,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? / ",
                      style: TextStyle(
                        fontFamily: 'GB',
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'GB',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
