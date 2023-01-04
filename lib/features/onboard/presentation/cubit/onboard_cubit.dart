import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/onboard_usecase.dart';
import 'package:auth_marketplace/core/base/base_state.dart';

/// OnBoardCubit for managing states for onboard related business logics

class OnBoardCubit extends Cubit<BaseState> {
  final OnBoardUseCase onBoardUseCase;

  OnBoardCubit({
    required this.onBoardUseCase,
  }) : super(StateInitial());

// add method if any

}
