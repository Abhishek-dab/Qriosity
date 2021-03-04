import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  List<Question> _csBank = [
    Question(
        'The CPU is responsible for executing instructions for the computer',
        true),
    Question(
        'Main memory is a place where the programs and data are store temporarily during processing',
        true),
    Question(
        'Secondary storage, similar to main memory, also stores programs and data',
        true),
    Question(
        'Each computer has its own machine language which is made of streams of 0s and 1s.',
        true),
    Question(
        'Symbolic languages use mnemonics to represent the various machine language instructions.',
        true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
  ];

  List<Question> _engBank = [
    Question('A RIVER is bigger than a STREAM.', true),
    Question('There are one thousand years in a CENTURY.', false),
    Question(' FOUNDED is the past tense of FOUND.', true),
    Question(' ANSWER can be used as a noun and a verb.', true),
    Question('SCARLET is a brilliant red colour.', true),
    Question('USED TO DOING and USED TO DO mean the same thing.', false),
    Question('You can use IMPROVE as a noun and as a verb.', false),
    Question(' DOZEN is equivalent to 20.', false),
    Question('The past tense of FIND is FOUND.', true),
    Question(' EQUIVALENT TO is (more or less) the same as EQUAL TO.', true),
  ];

  List<Question> _matBank = [
    Question('2+2=4', true),
    Question('4+4=8', true),
    Question('9+9=19', false),
    Question('19+9=38', false),
    Question('9+129=138', true),
    Question('9-19=10', false),
    Question('50+109=159', true),
    Question('91+19=119', false),
    Question('9+90=98', false),
  ];

  void nextQuestion(int i) {
    if (i == 1) {
      if (_questionNumber < _questionBank.length - 1) {
        _questionNumber++;
      }
    } else if (i == 2) {
      if (_questionNumber < _csBank.length - 1) {
        _questionNumber++;
      }
    } else if (i == 3) {
      if (_questionNumber < _matBank.length - 1) {
        _questionNumber++;
      }
    } else if (i == 4) {
      if (_questionNumber < _engBank.length - 1) {
        _questionNumber++;
      }
    }
  }

  String getQuestionText(int i) {
    if (i == 1) {
      return _questionBank[_questionNumber].questionText;
    } else if (i == 2) {
      return _csBank[_questionNumber].questionText;
    } else if (i == 3) {
      return _matBank[_questionNumber].questionText;
    } else if (i == 4) {
      return _engBank[_questionNumber].questionText;
    }
  }

  bool getCorrectAnswer(int i) {
    if (i == 1) {
      return _questionBank[_questionNumber].questionAnswer;
    } else if (i == 2) {
      return _csBank[_questionNumber].questionAnswer;
    } else if (i == 3) {
      return _matBank[_questionNumber].questionAnswer;
    } else if (i == 4) {
      return _engBank[_questionNumber].questionAnswer;
    }
  }

  bool isFinished(int i) {
    if (i == 1) {
      if (_questionNumber >= _questionBank.length - 1) {
        return true;
      } else {
        return false;
      }
    } else if (i == 2) {
      if (_questionNumber >= _csBank.length - 1) {
        return true;
      } else {
        return false;
      }
    } else if (i == 3) {
      if (_questionNumber >= _matBank.length - 1) {
        return true;
      } else {
        return false;
      }
    } else if (i == 4) {
      if (_questionNumber >= _engBank.length - 1) {
        return true;
      } else {
        return false;
      }
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
