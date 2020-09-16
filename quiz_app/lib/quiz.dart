import 'QnA.dart';

class Quiz {
  int _qnumb = 0;
  List<QnA> _questionBank = [
    QnA("Lucknow is the capital of Uttar Pradesh", true),
    QnA("Mumbai is the capital of India", false),
    QnA("Gandhinagar is the capital of Gujarat", true),
  ];
  void nextquestion() {
    if (_qnumb < _questionBank.length - 1) {
      _qnumb++;
    }
  }

  bool isFinished() {
    if (_qnumb >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _questionBank[_qnumb].question;
  }

  bool getAnswer() {
    return _questionBank[_qnumb].answer;
  }

  void reset() {
    _qnumb = 0;
  }
}