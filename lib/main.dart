import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/images/startlogo.png'),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: Column(
                  children: [
                    Text(
                      'From',
                      style: TextStyle(color: Colors.white.withOpacity(0.3)),
                    ),
                    Text(
                      'ExpertFlutter',
                      style: TextStyle(
                        color: Color(0xFF55B9F7),
                      ),
                    )
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
