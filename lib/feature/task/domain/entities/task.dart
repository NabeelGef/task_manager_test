import 'package:equatable/equatable.dart';

abstract class TodoEntity extends Equatable {
  const TodoEntity({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  final int id;
  final String todo;
  final bool completed;
  final int userId;



  Map<String, dynamic> toJson();

  @override
  List<Object?> get props ;
}
