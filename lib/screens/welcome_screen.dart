import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/roundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animation; //curve animations

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, //initializing the ticker
      //upperBound: 100.0,
    );

    // animation = CurvedAnimation(
    //     parent: controller,
    //     curve: Curves
    //         .decelerate); //when applying curve to controller we cant apply upperBound > 1

    //controller.forward();               //calling the controller IMP : you can also call reverse
    //controller.reverse(from: 1.0);          //reverse animation

    //forward animation -------------------------------------..........

    // controller.forward();
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    //----------------------------------------------------------------

    animation = ColorTween(begin: Colors.blue[800], end: Colors.white)
        .animate(controller); //Tween animations

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  //whenever uses a animation controller really important to add dispose
  @override
  void dispose() {
    //implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      //backgroundColor: Colors.red.withOpacity(controller.value),      //using ticker animations
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    //height: animation.value * 100, //animation value
                    //height: controller.value, //controlling size by ticker animations
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 300),
                  isRepeatingAnimation: false,
                  text: ['Flash Chat'],
                  //'${controller.value.toInt()}%',       //a loading indicator
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Log In', colour: Colors.lightBlueAccent, onPressed: () {
            //Go to login screen.
            Navigator.pushNamed(context, LoginScreen.id);
          },),
          RoundedButton(title: 'Register', colour: Colors.blueAccent, onPressed: () {
            //Go to login screen.
            Navigator.pushNamed(context, RegistrationScreen.id);
          },),  
          ],
        ),
      ),
    );
  }
}

