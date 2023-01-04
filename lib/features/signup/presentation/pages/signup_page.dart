import '../../../../core/core.dart';
import 'package:auth_marketplace/features/signup/signup_dependency_injection.dart';

import 'package:auth_marketplace/features/signup/presentation/cubit/signup_cubit.dart';
import '../../../../core/base/base_state.dart';
import 'package:auth_marketplace/features/signup/presentation/cubit/signup_state.dart';

import 'package:country_picker/country_picker.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final signUpCubit = slSignUp<SignUpCubit>();

  final _formKey = GlobalKey<FormState>();

  String countryCode = '91';

  String groupValue = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Your New Account',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'First name is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your first name",
                      labelText: "First Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    controller: firstNameController,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Last name is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your last name",
                        labelText: "Last Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                    controller: lastNameController,
                    //controller: fullName,
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<SignUpCubit, BaseState>(
                    builder: (context, state) {
                      countryCode = state is StateSearchResult
                          ? state.response
                          : countryCode;

                      return TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        inputFormatters: [kOnlyNumberFormatter],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Mobile number is empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    favorite: ['in'],
                                    onSelect: (Country country) {
                                      BlocProvider.of<SignUpCubit>(context)
                                          .selectCountry(country.phoneCode);
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0,
                                      top: 14.0,
                                      bottom: 16.0,
                                      right: 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                          child: Icon(Icons.arrow_drop_down)),
                                      Flexible(
                                        child: Text(
                                          "+" + countryCode,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            hintText: "Enter your phone number",
                            labelText: "Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
                        controller: phoneNumberController,
                        onChanged: (value) {},
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email.";
                      } else if (!MarketPlaceValidators().isEmailValid(value)) {
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
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<SignUpCubit, BaseState>(
                      builder: (context, state) {
                    var hidePassword = state is PasswordVisibilityState
                        ? state.hidePassword
                        : true;
                    return TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter your password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                BlocProvider.of<SignUpCubit>(context)
                                    .setPasswordVisibility();
                              },
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                      obscureText: hidePassword,
                      controller: passwordController,
                    );
                  }),
                  const SizedBox(height: 10),
                  BlocBuilder<SignUpCubit, BaseState>(
                      builder: (context, state) {
                    var hideConfirmPassword = state is PasswordVisibilityState
                        ? state.hideConfirmPassword
                        : true;
                    return TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm password is empty!';
                        } else if (confirmPasswordController.text !=
                            passwordController.text) {
                          return "Passwords do not match!";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Confirm your password",
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                BlocProvider.of<SignUpCubit>(context)
                                    .setConfirmPasswordVisibility();
                              },
                              icon: Icon(hideConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                      obscureText: hideConfirmPassword,
                      controller: confirmPasswordController,
                    );
                  }),
                  const SizedBox(height: 10),
                  CustomButton(
                    buttonText: 'Sign Up',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<SignUpCubit>(context).signUpData(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text,
                            phoneNumberController.text,
                            passwordController.text,
                            countryCode);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? '),
                      GestureDetector(
                        onTap: () {
                          if (NavigationService().containsOnGlobalRouteStack(
                              Routes.kRouteLogin, context)) {
                            NavigationService()
                                .popUntil(context, Routes.kRouteLogin);
                          } else {
                            NavigationService()
                                .push(context, Routes.kRouteLogin);
                          }
                        },
                        child: Text(
                          'sign in',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
