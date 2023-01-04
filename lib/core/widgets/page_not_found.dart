import '../../dashboard_page.dart';
import '../core.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // will be change in future
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'errorPageMsg',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.all(30),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DashBoard()));
                  },
                  child: Text('goToHome',
                      style: Theme.of(context).textTheme.button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
