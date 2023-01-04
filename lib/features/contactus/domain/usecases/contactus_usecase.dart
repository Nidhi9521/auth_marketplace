import '../../data/models/contactus_model.dart';
import '../repositories/contactus_repository.dart';
import '../../../../core/core.dart';
import 'package:dartz/dartz.dart';

class ContactUsUseCase implements UseCase<ContactUsModel, NoParams> {
  final ContactUsRepository contactUsRepository;

  ContactUsUseCase({required this.contactUsRepository});

  @override
  Stream<Either<Failure, ContactUsModel>> call(NoParams noParams) {
// TODO: implement call
    throw UnimplementedError();
  }
}
