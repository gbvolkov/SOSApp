import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class AcceptInvitationWidget extends StatefulWidget {
  const AcceptInvitationWidget({
    Key? key,
    this.hostUID,
  }) : super(key: key);

  final String? hostUID;

  @override
  _AcceptInvitationWidgetState createState() => _AcceptInvitationWidgetState();
}

class _AcceptInvitationWidgetState extends State<AcceptInvitationWidget> {
  String _currentPageLink = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AcceptInvitation'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where('uid',
            isEqualTo: widget.hostUID != '' ? widget.hostUID : null),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<UsersRecord> acceptInvitationUsersRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final acceptInvitationUsersRecord =
            acceptInvitationUsersRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      acceptInvitationUsersRecord.photoUrl,
                      'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/toonified.jpg?alt=media&token=afd96af7-96a9-4200-9c79-4bc73fe496ae',
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.hostUID != currentUserUid)
                      Text(
                        '${acceptInvitationUsersRecord.displayName} invites to join!',
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                    if (widget.hostUID == currentUserUid)
                      Text(
                        '${acceptInvitationUsersRecord.displayName}, ask friends for help.',
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                  ],
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            acceptInvitationUsersRecord.photoUrl,
                            'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/toonified.jpg?alt=media&token=afd96af7-96a9-4200-9c79-4bc73fe496ae',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Text(
                      acceptInvitationUsersRecord.displayName!,
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ),
                  if (widget.hostUID != currentUserUid)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'asks your help to fight craving.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                    ),
                  if (widget.hostUID == currentUserUid)
                    Text(
                      '🤷‍♀️ Why to invite yourself? \nShare with others!',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title2,
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 60, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.check,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            if (widget.hostUID != currentUserUid) {
                              final usersUpdateData = {
                                'groupMembers': FieldValue.arrayUnion(
                                    [currentUserReference]),
                              };
                              await acceptInvitationUsersRecord.reference
                                  .update(usersUpdateData);
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Thank you!'),
                                    content: Text(
                                        'Your help is highly appreciated!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('😍'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              _currentPageLink =
                                  await generateCurrentPageLink(context);
                              await Share.share(_currentPageLink);
                            }

                            context.pushNamed('Home');
                          },
                        ),
                        if (widget.hostUID != currentUserUid)
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.cancel_outlined,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 30,
                            ),
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('We are sorry'),
                                    content: Text('They will miss you'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('😢'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              context.pushNamed('Home');
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
