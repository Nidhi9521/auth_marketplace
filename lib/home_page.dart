import 'package:auth_marketplace/core/core.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('home page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  appLocale!.translate('demoTxt'),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 20, color: Colors.black),
                ),
              )),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                child: TextButton(
                    onPressed: () {
                      NavigationService().push(
                        context,
                        Routes.kRouteLogin,
                      );
                    },
                    child: Text('Go to login',
                        style: Theme.of(context).textTheme.button)),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                child: TextButton(
                    onPressed: () {
                      NavigationService().push(
                        context,
                        Routes.kRouteAbout,
                      );
                    },
                    child: Text('Go to about',
                        style: Theme.of(context).textTheme.button)),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                child: TextButton(
                    onPressed: () {
                      NavigationService().push(
                        context,
                        Routes.kRouteSignUp,
                      );
                    },
                    child: Text('Go to signup',
                        style: Theme.of(context).textTheme.button)),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                child: TextButton(
                    onPressed: () {
                      NavigationService().push(
                        context,
                        Routes.kRouteContactUs,
                      );
                    },
                    child: Text('Contact Us',
                        style: Theme.of(context).textTheme.button)),
              ),
            ],
          ),
        ));
  }
}
