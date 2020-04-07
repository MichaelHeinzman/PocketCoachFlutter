import 'package:flutter/material.dart';
import 'package:pocket_coach/app/pages/data.dart';
import 'package:pocket_coach/app/pages/gym.dart';
import 'package:pocket_coach/app/pages/messages.dart';
import 'package:pocket_coach/app/pages/profile.dart';
import 'package:pocket_coach/app/pages/social.dart';
import 'package:pocket_coach/app/pages/leaderboards.dart';
import 'package:pocket_coach/app/pages/workout.dart';
import 'package:pocket_coach/common_widgets/platform_alert_dialog.dart';
import 'package:pocket_coach/services/auth.dart';
import 'package:pocket_coach/services/database.dart';
import 'package:provider/provider.dart';

final PageController _socialTabPageController = PageController(initialPage: 1);

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String _appBarText = 'Social';
  static List<Widget> _pageList = <Widget>[
    PageView(
      controller: _socialTabPageController,
      pageSnapping: true,
      children: <Widget>[Leaderboards(), Social(), Messages()],
    ),
    Workout(),
    Profile(),
    Data(),
    Gym()
  ];

  Future _onTap(int index) async {
    Database db = Database();
    String profileText =
        await db.getField(Provider.of<User>(context).uid, 'username');
    profileText = profileText.toUpperCase();
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 0:
          _appBarText = 'Social';
          break;
        case 1:
          _appBarText = 'Workout';
          break;
        case 2:
          _appBarText = profileText;
          break;
        case 3:
          _appBarText = 'Data';
          break;
        case 4:
          _appBarText = 'Gym';
          break;
      }
    });
  }

  /*void _onScroll(int index) {
    setState(() {
      switch (index) {
        case 0:
          _appBarText = 'Leaderboards';
          break;
        case 1:
          _appBarText = 'Social';
          break;
        case 2:
          _appBarText = 'Messages';
          break;
      }
    });
  }*/

  @override
  void initState() {
    super.initState();
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: new Text(_appBarText),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: Center(
        child: NotificationListener<ScrollEndNotification>(
            onNotification: (ScrollEndNotification notification) {
              setState(() {
                // _onScroll(_socialTabPageController.page.toInt());
              });
            },
            child: _pageList.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Image.asset('assets/images/SocialIcon.png'),
            title: Text('Social'),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/images/WorkoutIcon.png'),
            title: Text('Workout'),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/images/ProfileIcon.png'),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/images/DataIcon.png'),
            title: Text('Data'),
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/images/GymIcon.png'),
            title: Text('Gym'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
