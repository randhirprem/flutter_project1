import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  List<String> selectedAnswers = [];

  //Widget? activeScreen; // init state

  //@override //init state
  //void initState() { //init state
   // activeScreen = StartScreen(switchScreen);//init state
   // super.initState();//init state
  //}//init state
  
  // The following method uses a turnary expression
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen(); // init methof
      activeScreen = 'question-screen'; // this a turnary expression
    });
  }

  void chooseAnswer (String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState((){
        activeScreen = 'results-screen';
      });
    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }
  @override
  Widget build(context){
    // if logic if possible
   // final screenWidget = activeScreen == 'start-screen'
       // ? StartScreen(switchScreen)
      //  : const QuestionScreen();

    Widget screenWidget = StartScreen(switchScreen);

      if(activeScreen == 'question-screen'){
        screenWidget = QuestionScreen(
          onSelectAnswer: chooseAnswer,);
      }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers,
      onRestart: restartQuiz,
      );
    }
      

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 96, 4, 234),
                Color.fromARGB(255, 197, 123, 12)
            ],
            begin: Alignment.topLeft,
            end:Alignment.bottomRight
            ),
          ),
        //init state  child: activeScreen,//init state
          child: screenWidget,
          
          //activeScreen == 'start-screen' 
         // ? StartScreen(switchScreen) 
          //: const QuestionScreen(),
        ),
      ),
    );
  }
}