import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/V_logo_design_for_business_or_company_(2).png',
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Login': (data) async => LoginWidget(),
  'createAccount': (data) async => CreateAccountWidget(),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'creategroupchat': (data) async => CreategroupchatWidget(),
  'editProfile': (data) async => EditProfileWidget(
        userProfile: getParameter(data, 'userProfile'),
      ),
  'createUser': (data) async => CreateUserWidget(),
  'changePassword': (data) async => ChangePasswordWidget(),
  'otppage': (data) async => OtppageWidget(),
  'setting': (data) async => SettingWidget(),
  'phone': (data) async => PhoneWidget(),
  'mychatpage': (data) async => MychatpageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'mypost': (data) async => NavBarPage(initialPage: 'mypost'),
  'chatpage': (data) async => NavBarPage(initialPage: 'chatpage'),
  'followers': (data) async => FollowersWidget(),
  'inviteusers': (data) async => InviteusersWidget(),
  'following': (data) async => FollowingWidget(),
  'Users': (data) async => NavBarPage(initialPage: 'Users'),
  'postdetail': (data) async => PostdetailWidget(
        postDocRef: getParameter(data, 'postDocRef'),
      ),
  'Neepostpage': (data) async => NeepostpageWidget(),
  'profilePage': (data) async => NavBarPage(initialPage: 'profilePage'),
  'postedit': (data) async => PosteditWidget(
        docRef: getParameter(data, 'docRef'),
      ),
  'welcomepost': (data) async => WelcomepostWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
