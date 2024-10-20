
import '../../domain/entities/task.dart';

class TodoModel extends TodoEntity {
  const TodoModel({required super.id, required super.todo,
    required super.completed, required super.userId,});

  factory TodoModel.fromJson(Map<String, dynamic> json){
    return TodoModel(
      id: json["id"],
      todo: json["todo"],
      completed: json["completed"],
      userId: json["userId"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
  };
  @override
  List<Object?> get props => [
    id, todo, completed, userId, ];

}
