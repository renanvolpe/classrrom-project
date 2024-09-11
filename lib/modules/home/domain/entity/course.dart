// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CourseEntity with EquatableMixin {
  int id;
  String descricao;
  String text;
  CourseEntity({
    required this.id,
    required this.descricao,
    required this.text
  });
  
    @override
  List<Object?> get props => [id, descricao, text];


}
