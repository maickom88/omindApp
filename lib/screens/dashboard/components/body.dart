import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omindconsluting/components/rounded_button.dart';
import 'package:omindconsluting/controllers/questions_controller.dart';
import 'cards_list.dart';

class Body extends StatefulWidget {
  final String email;
  final String uid;

  const Body({Key key, this.email, this.uid}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 40),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  'Account',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                title: Text(
                  'Help',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              SizedBox(height: 20),
              RoundedButton(text: "Sign up")
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/signup_top.png',
            height: _height * 0.22,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () => _key.currentState.openDrawer(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.archive,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: _height * 0.10),
              Expanded(
                child: GetBuilder<QuestionsController>(
                  init: QuestionsController(),
                  builder: (controller) {
                    if (controller.questions.length > 0) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.questions.length,
                        itemBuilder: (context, int index) {
                          return CardsList(
                            uid: widget.uid,
                            email: widget.email,
                            titleQuestion: controller
                                .questions[index].data['LifePackName'],
                            desQuestion:
                                controller.questions[index].data['Description'],
                            documentId: controller.questions[index].documentID,
                          );
                        },
                      );
                    } else {
                      controller.getQuantQuestions(widget.email, widget.uid);
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
