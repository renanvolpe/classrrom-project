import 'package:classroom_project/modules/home/domain/repository/abstract_student_repository.dart';

class GetStudentUsecase {
  GetStudentUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  Future call() async{
    var response = await _repository.getStudent();
    //check something here
    return response;
  }
}

class GetAllStudentsUsecase {
  GetAllStudentsUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  Future call() async{
    var response = await _repository.getAllStudents();
    //check something here
    return response;
  }
}

class DeleteStudentUsecase {
  DeleteStudentUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  Future call() async{
    var response = await _repository.deleteStudent();
    //check something here
    return response;
  }
}

class AddStudentUsecase {
  AddStudentUsecase({
    required IStudentRepository repository,
  }) : _repository = repository;

  final IStudentRepository _repository;

  Future call() async{
    var response = await _repository.addStudent();
    //check something here
    return response;
  }
}


