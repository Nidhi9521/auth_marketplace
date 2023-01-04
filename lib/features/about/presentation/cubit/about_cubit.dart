import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/about_usecase.dart';
import 'package:auth_marketplace/core/base/base_state.dart';

/// AboutCubit for managing states for about related business logics

class AboutCubit extends Cubit<BaseState> {
  final AboutUseCase aboutUseCase;

  AboutCubit({
    required this.aboutUseCase,
  }) : super(StateInitial());

// add method if any

}
