import 'package:auth_marketplace/core/base/base_state.dart';
import 'package:auth_marketplace/core/core.dart';
import 'package:auth_marketplace/features/login/login_dependency_injection.dart';
import 'package:auth_marketplace/features/login/presentation/cubit/login_cubit.dart';

import 'login_page_details.dart';

class Login extends StatelessWidget {
  final cubit = slLogin<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, BaseState>(
      bloc: cubit..checkUserAuthSession(),
      builder: (context, state) {
        if (state is StateOnSuccess && state.response == true) {
          return SizedBox();
        } else {
          return LoginDetail();
        }
      },
      listener: (_, state) {
        if (state is StateOnSuccess && state.response == true) {
          NavigationService().popUntil(context, Routes.kRouteHome);
        }
      },
    );
  }
}
