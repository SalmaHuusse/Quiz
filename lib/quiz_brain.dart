import 'package:quizzler/question.dart';

class   QuizBrain{

  int _questionNumber =0;
   List<Question> _questionBank =[
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A Slug\'s blood is green.', a: true),
  ];

    void nextQuestion(){
      if(_questionNumber < _questionBank.length - 1){
        _questionNumber++;
      }

    }

  String getQuestionText( ){
    return _questionBank[_questionNumber].questionText;
  }
  bool getCorrectAnswer( ){
    return _questionBank[_questionNumber].questionAnswer;
  }
}