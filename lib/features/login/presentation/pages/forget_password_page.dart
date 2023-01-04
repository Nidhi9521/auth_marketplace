import 'package:auth_marketplace/features/login/login_dependency_injection.dart';

import 'package:auth_marketplace/features/login/presentation/cubit/login_cubit.dart';

import '../../../../../core/core.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final loginCubit = slLogin<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 08,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter your email"),
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email.";
                  }
                  if (!MarketPlaceValidators().isEmailValid(value)) {
                    return "Please enter valid email.";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: CustomButton(
                  buttonText: 'Send Link',
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                  onPressed: () {
                    if (_formKey.currentState != null) {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        loginCubit.performForgetPassword(
                            email: emailController.text);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
