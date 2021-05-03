import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Portfolio());
}

// Application Strings
// Site Strings
final String bTitle = 'Bernice Perpetua | Portfolio';

final String bDescription =
    'Freelance Mobile and Web Developer | Data Scientist | Artist';

final String bWhatIdo = 'Stacks';
final String bCard1title = 'Mobile and Web App Development';
final String bCard2title = 'Data Scientist';
final String bCard3title = 'Artist';
final String bWhoIam = 'Introduction';
final String bWhoIamDetails =
    'Experienced Mobile App Developer, love creating amazing Apps for Mobile && Fan of Analysing Data to gain useable insights';
final String bCard1Descrption =
    'Experienced app developer, interested in tramsforming societal and clients problem into a user friendly mobile and web application in android and ios \n Java | Dart-Flutter | Python';
final String bCard2Descrption =
    'Experinced Data Analyst, knowledgeable in researching, gethering and analysing data, gaining insights and presenting findings in visualizations to increase client revenue and solving problem \n Python | Excel | Power Pivot, BI';
final String bCard3Descrption =
    'Experienced in creating creativity through arts \n Painting | Drawing';

final String bCvUrl =
    'https://drive.google.com/file/d/1XgIK5AQOJJ1wQpd_QNSLv0R-G1M1GW3D/view?usp=sharing';

//final String for Contact Page
final String bContactCardTitle = 'Have a problem to solve? GET IN TOUCH';
final String bEmail = 'berniceanne3@gmail.com';

//final Strings for Footer present in contact_page.dart
final String bRightsReserved = '© Bernice Perpetua. All rights reserved.';

// Our main class that holds all other widgets and classes
class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  // double deviceWidth;
  // double deviceHeight;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Scrollbar(radius: Radius.circular(12), child: HomePage()),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var width;
  var height;

  final List pageList = [
    TopNavbar(),
    ProfilePage(),
    ServicePage(),
    // PortfolioPage(),
    // ContactPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return pageList[index];
        },
      ),
    ));
  }
}

// Navigation bar class

class TopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatefulWidget {
  @override
  _DesktopNavbarState createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        child: Container(
            child: Row(
          children: [
            Button(),
          ],
        )));
  }
}

class MobileNavbar extends StatefulWidget {
  @override
  _MobileNavbarState createState() => _MobileNavbarState();
}

class _MobileNavbarState extends State<MobileNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Button()
        ],
      ),
    );
  }
}

//  This button represents the our CV download
class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.white10,
          ),
        ),
        onPressed: () {},
        child: Text('Download CV',
            style: TextStyle(fontSize: 30, fontFamily: 'MuseoSans')),
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 5,
      ),
    );
  }
}

// Profile page class
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopProfilePage();
        } else {
          return MobileProfilePage();
        }
      },
    );
  }
}

class DesktopProfilePage extends StatefulWidget {
  @override
  _DesktopProfilePageState createState() => _DesktopProfilePageState();
}

class _DesktopProfilePageState extends State<DesktopProfilePage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height, width: width, child: stackedWidgets(height, width));
  }
}

class MobileProfilePage extends StatefulWidget {
  @override
  _MobileProfilePageState createState() => _MobileProfilePageState();
}

class _MobileProfilePageState extends State<MobileProfilePage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bernice Perpetua Quarshie",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              height: 0.6 * height,
              width: 0.4 * width,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset('assets/bern.jpg')),
            ),
          ),
          Text(
            bDescription,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: whoIAmWidget(30),
          ),
          whoIamDetailsWidget(30),
        ],
      ),
    );
  }
}

//  This is part os our profile page that holds the name and image for our desktop view
Widget stackedWidgets(double height, double width) {
  return Stack(
    children: [
      Positioned(
          top: 0.28 * height,
          left: 0.12 * width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bernice Perpetua Quarshie",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              ),
              Text(
                bDescription,
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          )),
      Positioned(
        top: 0.10 * height,
        right: 0.08 * width,
        child: Container(
          height: 0.5 * height,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image(
              image: AssetImage('assets/bern.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  );
}

// This section show what we do (Stacks)
class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopStackPage();
      } else {
        return MobileStackPage();
      }
    });
  }
}

class DesktopStackPage extends StatefulWidget {
  @override
  _DesktopStackPageState createState() => _DesktopStackPageState();
}

class _DesktopStackPageState extends State<DesktopStackPage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: whatIDoWidget(45)),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              whatIDoCard(
                  Colors.yellow.withOpacity(0.4),
                  'assets/icons/mob_dev.png',
                  bCard1title,
                  bCard1Descrption,
                  width,
                  height,
                  0.22 * width,
                  400,
                  18,
                  14),
              whatIDoCard(
                  Colors.brown.withOpacity(0.4),
                  'assets/icons/data.png',
                  bCard2title,
                  bCard2Descrption,
                  width,
                  height,
                  0.22 * width,
                  400,
                  18,
                  14),
              whatIDoCard(
                  Colors.blue.withOpacity(0.4),
                  'assets/icons/art.png',
                  bCard3title,
                  bCard3Descrption,
                  width,
                  height,
                  0.22 * width,
                  400,
                  18,
                  14),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: whoIAmWidget(45),
              ),
              SizedBox(
                width: 0.20 * width,
              ),
              whoIamDetailsWidget(80)
            ],
          )
        ],
      ),
    );
  }
}

class MobileStackPage extends StatefulWidget {
  @override
  _MobileStackPageState createState() => _MobileStackPageState();
}

class _MobileStackPageState extends State<MobileStackPage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: width,
      //height: height,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          whatIDoWidget(30),
          SizedBox(
            height: 30,
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.yellow.withOpacity(0.4),
            'assets/icons/mob_dev.png',
            bCard1title,
            bCard1Descrption,
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.brown.withOpacity(0.4),
            'assets/icons/data.png',
            bCard2title,
            bCard2Descrption,
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.blue.withOpacity(0.4),
            'assets/icons/art.png',
            bCard3title,
            bCard3Descrption,
          ),
          SizedBox(
            height: 30,
          ),
          // whoIAmWidget(30),
          // whoIamDetailsWidget(30)
        ],
      ),
    );
  }
}

Widget whatIDoWidget(double fontSize) {
  return Text(bWhatIdo,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600));
}

Widget whatIDoCard(
    Color color,
    String iconPath,
    String title,
    String description,
    double devWidth,
    double devHeight,
    double cardWidth,
    double cardHeight,
    double cardTitleTextSize,
    double cardDescriptionTextSize) {
  return Material(
    //color: Colors.white54,
    //shadowColor: Colors.tealAccent,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    elevation: 20,
    child: Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.2, color: Colors.white12, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120,
                height: 120,
                color: color,
                child: Center(
                  child: Image(
                      //fit: BoxFit.cover,
                      width: 60,
                      image: AssetImage(
                        iconPath,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: cardTitleTextSize, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: cardDescriptionTextSize,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget whoIAmWidget(double fontSize) {
  return Text(bWhoIam,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600));
}

Widget whoIamDetailsWidget(double spaceAfterCards) {
  return Container(
    margin: EdgeInsets.only(top: spaceAfterCards),
    width: 600,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bWhoIamDetails,
          textAlign: TextAlign.left,
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 14,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
            ),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () async {
                  const url = 'https://github.com/Perpety';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  const url = 'https://www.linkedin.com/in/bernicequarshie/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  const url = 'https://twitter.com/AbenaPm';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 30,
                  color: Colors.pink,
                ),
                onPressed: () async {
                  const url = 'https://www.instagram.com/ahbenaselorm/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  const url = 'https://web.facebook.com/benice.anne';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
          ],
        )
      ],
    ),
  );
}

Widget whatIdoCardMobile(double height, double width, Color color,
    String imagePath, String title, String description) {
  return Column(
    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        //color: Colors.black,
        // height: height / 6,
        width: width,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          elevation: 20,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: color,
                ),
                width: 120,
                height: 130,
                child: Center(
                  child: Image(
                      //fit: BoxFit.cover,
                      width: 60,
                      image: AssetImage(
                        imagePath,
                      )),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
