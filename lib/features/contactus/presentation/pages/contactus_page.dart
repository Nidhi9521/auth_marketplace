import 'package:auth_marketplace/core/core.dart';

class ContactUsHome extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.translate('contact'),
            style: Theme.of(context).textTheme.headline1!),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                maxLines: 1,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Your name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                controller: nameController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
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
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: detailController,
                maxLines: 5,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                child: CustomButton(
                  buttonText: 'Send',
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      // Write your logic to send mail
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
