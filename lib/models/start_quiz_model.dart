class QuizTestModel {
  bool? success;
  Data? data;
  String? message;

  QuizTestModel({this.success, this.data, this.message});

  QuizTestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  Quiz? quiz;
  List<AllQuestions>? allQuestions;
  int? userGivenTest;

  Data({this.quiz, this.allQuestions, this.userGivenTest});

  Data.fromJson(Map<String, dynamic> json) {
    quiz = json['quiz'] != null ? Quiz.fromJson(json['quiz']) : null;
    if (json['all_questions'] != null) {
      allQuestions = <AllQuestions>[];
      json['all_questions'].forEach((v) {
        allQuestions!.add(AllQuestions.fromJson(v));
      });
    }
    userGivenTest = json['user_given_test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quiz != null) {
      data['quiz'] = quiz!.toJson();
    }
    if (allQuestions != null) {
      data['all_questions'] =
          allQuestions!.map((v) => v.toJson()).toList();
    }
    data['user_given_test'] = userGivenTest;
    return data;
  }
}

class Quiz {
  int? id;
  int? userid;
  int? courseId;
  String? title;
  String? passPercent;
  String? numOfAttemp;
  String? questions;
  String? publish;
  String? createdAt;
  String? modifyAt;

  Quiz(
      {this.id,
      this.userid,
      this.courseId,
      this.title,
      this.passPercent,
      this.numOfAttemp,
      this.questions,
      this.publish,
      this.createdAt,
      this.modifyAt});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    courseId = json['course_id'];
    title = json['title'];
    passPercent = json['pass_percent'];
    numOfAttemp = json['num_of_attemp'];
    questions = json['questions'];
    publish = json['publish'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['course_id'] = courseId;
    data['title'] = title;
    data['pass_percent'] = passPercent;
    data['num_of_attemp'] = numOfAttemp;
    data['questions'] = questions;
    data['publish'] = publish;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    return data;
  }
}

class AllQuestions {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? createdAt;
  String? modifyAt;
  int? userid;
  int? categoryId;
  String? categoryName;
  List<Answers>? answers;

  AllQuestions(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.createdAt,
      this.modifyAt,
      this.userid,
      this.categoryId,
      this.categoryName,
      this.answers});

  AllQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
    userid = json['userid'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    data['userid'] = userid;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? questionId;
  String? answer;
  String? isTrue;
  String? createdAt;
  String? modifyAt;

  Answers(
      {this.id,
      this.questionId,
      this.answer,
      this.isTrue,
      this.createdAt,
      this.modifyAt});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    answer = json['answer'];
    isTrue = json['is_true'];
    createdAt = json['created_at'];
    modifyAt = json['modify_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_id'] = questionId;
    data['answer'] = answer;
    data['is_true'] = isTrue;
    data['created_at'] = createdAt;
    data['modify_at'] = modifyAt;
    return data;
  }
}