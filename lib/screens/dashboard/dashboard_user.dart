import 'package:flutter/material.dart';

import 'components/body.dart';

class DashboardUser extends StatefulWidget {
  @override
  _DashboardUserState createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
