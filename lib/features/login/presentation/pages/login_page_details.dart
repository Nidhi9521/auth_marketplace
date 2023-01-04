import 'package:auth_marketplace/features/login/presentation/cubit/login_cubit.dart';

import 'package:auth_marketplace/features/login/presentation/widgets/email_and_password_widget.dart';
import 'package:auth_marketplace/features/login/presentation/widgets/profile_image_widget.dart';
import 'package:auth_marketplace/features/login/login_dependency_injection.dart';
import 'package:auth_marketplace/core/core.dart';
import 'package:auth_marketplace/core/base/base_state.dart';

class LoginDetail extends StatelessWidget {
  final loginCubit = slLogin<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: BlocListener<LoginCubit, BaseState>(
          bloc: loginCubit,
          listener: (context, state) {
            if (state is StateErrorGeneral) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(AppLocalizations.of(context)!
                      .getErrorMessage(state.errorCode))));
            }
          },
          child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const ProfileImageWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  EmailAndPasswordWidget(loginCubit: loginCubit),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do n't have an account? "),
                      GestureDetector(
                        onTap: () {
                          if (NavigationService().containsOnGlobalRouteStack(
                              Routes.kRouteSignUp, context)) {
                            NavigationService()
                                .popUntil(context, Routes.kRouteSignUp);
                          } else {
                            NavigationService()
                                .push(context, Routes.kRouteSignUp);
                          }
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
