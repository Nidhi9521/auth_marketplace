import '../datasources/contactus_data_source.dart';
import '../../domain/repositories/contactus_repository.dart';

class ContactUsRepositoryImpl implements ContactUsRepository {
  final ContactUsDataSource contactUsDataSource;

  ContactUsRepositoryImpl({required this.contactUsDataSource});

  // Add methods here
}
