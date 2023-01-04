import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_marketplace/core/base/base_state.dart';
import 'package:auth_marketplace/features/contactus/domain/usecases/contactus_usecase.dart';

class ContactUsCubit extends Cubit<BaseState> {
  final ContactUsUseCase contactUsUseCase;

  ContactUsCubit({
    required this.contactUsUseCase,
  }) : super(StateInitial());

// add method if any

}
