import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionService {
  Future<List<Map<String, dynamic>>> getAllQuestions() async {
    List<Map<String, dynamic>> questionsList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('questions').get();

      for (var doc in snapshot.docs) {
        Map<String, dynamic> question = doc.data();
        question['id'] = doc.id;
        questionsList.add(question);
      }
    } catch (e) {
      print('Error getting questions: $e');
    }

    return questionsList;
  }

  Future<List<Map<String, dynamic>>> getAllQuiz() async {
    List<Map<String, dynamic>> quiList = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Quiz').get();

      for (var doc in snapshot.docs) {
        Map<String, dynamic> quiz = doc.data();
        quiz['id'] = doc.id;
        quiList.add(quiz);
      }
    } catch (e) {
      print('Error getting questions: $e');
    }
    return quiList;
  }

  Future<List<Map<String, dynamic>>> getAllVideo() async {
    List<Map<String, dynamic>> vedioList = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Video').get();

      for (var doc in snapshot.docs) {
        Map<String, dynamic> vd = doc.data();
        vd['id'] = doc.id;
        vedioList.add(vd);
      }
    } catch (e) {
      print('Error getting questions: $e');
    }
    return vedioList;
  }
}
