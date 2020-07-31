import 'package:flutter/material.dart';

import 'components/body.dart';

class DashboardUser extends StatefulWidget {
  final String email;
  final String uid;

  const DashboardUser({Key key, this.email, this.uid}) : super(key: key);
  @override
  _DashboardUserState createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(email: widget.email, uid: widget.uid));
  }
}
