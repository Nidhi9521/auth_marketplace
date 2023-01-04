import 'package:auth_marketplace/core/core.dart';

import 'package:auth_marketplace/features/login/presentation/cubit/login_cubit.dart';
import 'package:auth_marketplace/core/base/base_state.dart';

class EmailAndPasswordWidget extends StatelessWidget {
  EmailAndPasswordWidget({required this.loginCubit, Key? key})
      : super(key: key);

  final LoginCubit loginCubit;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter email.";
                }
                if (!MarketPlaceValidators().isEmailValid(value)) {
                  return "Please enter valid email.";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
              controller: emailEditingController,
            ),
            const SizedBox(height: 20),
            BlocBuilder<LoginCubit, BaseState>(builder: (context, state) {
              var hidePassword =
                  state is StateOnSuccess ? state.response : true;
              return TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<LoginCubit>(context)
                              .setPasswordVisibility();
                        },
                        icon: Icon(hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility))),
                obscureText: hidePassword,
                controller: passwordEditingController,
              );
            }),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Text(
                  "Forget Password?",
                  style: TextStyle(fontSize: 14),
                ),
                onPressed: () {
                  NavigationService()
                      .push(context, Routes.kRouteForgetPassword);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              buttonText: 'Login',
              textStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
              onPressed: () {
                if (_formKey.currentState != null) {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    loginCubit.performEmailAndPasswordSignIn(
                        email: emailEditingController.text,
                        password: passwordEditingController.text);
                  }
                }
              },
            ),
          ],
        ));
  }
}
