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
}
