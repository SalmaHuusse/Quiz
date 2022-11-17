import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';


QuizBrain quizBrain = QuizBrain();

void main()=> runApp(Quizzler());

class Quizzler extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home:  Scaffold(
       backgroundColor: Colors.grey.shade900,
       body: const SafeArea(
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 10.0),
           child: QuizPage(),
         ),
       ),
     ),
   );
  }
}
 class QuizPage extends StatefulWidget{
  const QuizPage({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
_QuizPageState  createState() => _QuizPageState();
  }
  class _QuizPageState extends State<QuizPage>{
   List<Widget>scoreKeeper = [ ];


   void checkAnswer(bool userPickedAnswer){
     bool  correctAnswer = quizBrain.getCorrectAnswer( );
     if(userPickedAnswer ==  correctAnswer){
       scoreKeeper.add(Icon(Icons.check , color: Colors.green,));
     }else{
       scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
     }
     setState((){
       quizBrain.nextQuestion();
     });


   }

  @override
  Widget build(BuildContext context) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     crossAxisAlignment: CrossAxisAlignment.stretch,
     children:  [
       Expanded(
         flex: 5,
           child: Padding(padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                 quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
           ),
       ),
       Expanded(
           child:Padding(padding: const EdgeInsets.all(15.0),
           child: FlatButton(
             textColor: Colors.white,
               color: Colors.green,
               child: const Text(
                 'True',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
                 ),
               ),
             onPressed: (){
               checkAnswer(true);
             },
           ),
           ),
       ),
       Expanded(
         child:Padding(padding: EdgeInsets.all(15.0),
           child: FlatButton(
             textColor: Colors.white,
             color: Colors.red,
             child: const Text(
               'Fales',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
               ),
             ),
             onPressed: (){
              checkAnswer(false);
             },
           ),
         ),
       ),
       Row(
         children: scoreKeeper,


       ),
     ],
   );
  }


}