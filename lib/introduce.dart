// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroduceScreen extends StatefulWidget {
  const IntroduceScreen({super.key});

  @override
  State<IntroduceScreen> createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {
final snackBar = SnackBar(
  duration: Duration(seconds : 2),
  content: Text('Введите ваше имя'),
);

  final introKey = GlobalKey<IntroductionScreenState>();
  
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      scrollPhysics: ClampingScrollPhysics(),
      controlsPadding: EdgeInsets.all(8),
      key: introKey,
      globalBackgroundColor: Colors.transparent,
      allowImplicitScrolling: false,
      hideBottomOnKeyboard: false,
      dotsContainerDecorator:
          BoxDecoration(color: Color.fromRGBO(69, 202, 255, 1)),
      pages: [
        PageViewModel(
            titleWidget: Text(
              'Зарабатывайте монеты отвечая на вопросы\nи решая задачи',
              style: GoogleFonts.asap(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromRGBO(255, 27, 107, 1),
                        Color.fromRGBO(69, 202, 255, 1)
                      ]),
                ),
                bodyAlignment: Alignment.center),
            image: Image.asset(
              'assets/introduce/coin.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            body: ''),
        PageViewModel(
            titleWidget: Text(
              'Обменивайте монеты на полезные советы\nо финансовой грамотности',
              style: GoogleFonts.asap(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            image: Image.asset('assets/introduce/box.png'),
            decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromRGBO(255, 27, 107, 1),
                        Color.fromRGBO(69, 202, 255, 1)
                      ]),
                ),
                bodyAlignment: Alignment.center),
            body: ''),
        PageViewModel(
            titleWidget: Text(
              'Введите ваше имя',
              style: GoogleFonts.asap(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromRGBO(255, 27, 107, 1),
                        Color.fromRGBO(69, 202, 255, 1)
                      ]),
                ),
                bodyAlignment: Alignment.center),
            bodyWidget: TextField(
              autofocus: true,
              controller: nameController,
              keyboardType: TextInputType.text,
              style: GoogleFonts.asap(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
              showCursor: false,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'ИМЯ',
                hintStyle:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                border: InputBorder.none,
              ),
            ))
      ],
      done: const Text('Готово', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () async{
        if(nameController.text == '') {
         ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else { 
         await  setUsername(nameController.text);

         Navigator.pushReplacement(context, MaterialPageRoute(builder : (context) => HomePage()));
        }
      },
      doneStyle: TextButton.styleFrom(
          foregroundColor: Colors.white,
          alignment: Alignment.topRight,
          splashFactory: NoSplash.splashFactory),
      nextStyle: TextButton.styleFrom(
          foregroundColor: Colors.white,
          alignment: Alignment.topRight,
          splashFactory: NoSplash.splashFactory),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Colors.black,
        color: Colors.white,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

  setUsername(username)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setInt('coin', 0);
    await prefs.setStringList('checkpoints', [
      '1','2','3','4','5','6','7','8','9','10'
    ]);
    await prefs.setStringList('checkpointsAdvices', [
      '1','2','3','4','5','6','7','8','9','10'
    ]);

         }
}
