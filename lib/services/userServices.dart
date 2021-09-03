import 'package:test_app/models/userModel.dart';
import 'package:test_app/utils/repository.dart';

class UserServices{
  Repository? _repository;

  UserServices(){
    _repository = Repository();
  }

  saveUsers(User user)async{
    return await _repository!.insertData('userModel', user.userMap());
  }
}

// final String userNotes = 'user';
//
// class UserFeilds {
//   static final List<String> values = [
//     /// Add all fields
//     id, title, description,
//   ];
//
//   static final String id = '_id';
//   static final String title = 'title';
//   static final String description = 'description';
// }
//
// class User {
//   final int? id;
//   final String title;
//   final String description;
//
//   const User({
//     this.id,
//     required this.title,
//     required this.description,
//   });
//
//   User copy({
//     int? id,
//     String? title,
//     String? description,
//   }) =>
//       User(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         description: description ?? this.description,
//       );
//
//   static User fromJson(Map<String, Object?> json) => User(
//     id: json[UserFeilds.id] as int?,
//     title: json[UserFeilds.title] as String,
//     description: json[UserFeilds.description] as String,
//     createdTime: DateTime.parse(json[UserFeilds.time] as String),
//   );
//
//   Map<String, Object?> toJson() => {
//     UserFeilds.id: id,
//     UserFeilds.title: title,
//     UserFeilds.description: description,
//     UserFeilds.time: createdTime.toIso8601String(),
//   };
// }





