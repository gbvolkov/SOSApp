import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SosWidget extends StatefulWidget {
  const SosWidget({Key? key}) : super(key: key);

  @override
  _SosWidgetState createState() => _SosWidgetState();
}

class _SosWidgetState extends State<SosWidget> {
  ChatsRecord? lastChat;
  String uploadedFileUrl = '';
  TextEditingController? txtSOSMessageController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SOS'});
    txtSOSMessageController = TextEditingController(text: 'S.O.S.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.menu,
            color: Color(0xFF3E494A),
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Ask for help',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.notifications_outlined,
              color: Color(0xFF3E494A),
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hello,',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                    ),
                              ),
                              AuthUserStreamWidget(
                                child: Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AuthUserStreamWidget(
                          child: Container(
                            width: 60,
                            height: 60,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                currentUserPhoto,
                                'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/toonified.jpg?alt=media&token=afd96af7-96a9-4200-9c79-4bc73fe496ae',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 60, 30, 0),
                    child: Text(
                      'Ready to give up?',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 15, 60, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          child: custom_widgets.MarkdownWidget(
                            width: double.infinity,
                            height: 40,
                            mdText:
                                'Add a short message and press the SOS button to [**get support**]()',
                            txtColor: Color(0xFF989898),
                            linkColor: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: custom_widgets.CountdownWidget(
                            width: 200,
                            height: 200,
                            duration: 30,
                            initialDuration: 0,
                            ringColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            strokeWidth: 5.0,
                            textColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            textFontSize: 20.0,
                            textFormat: 's',
                            isReverse: false,
                            isReverseAnimation: true,
                            isTimerTextShown: true,
                            autoStart: true,
                            label: 'S.O.S.',
                            activeTimerEvents: ['onTap'].toList(),
                            onComplete: () async {
                              if (valueOrDefault(
                                      currentUserDocument?.lastChatStatus, 0) !=
                                  0) {
                                setState(() => FFAppState().sliderValue = 4);

                                final chatsCreateData = {
                                  ...createChatsRecordData(
                                    initiator: currentUserReference,
                                    chatMessage: txtSOSMessageController!.text,
                                    chatImage: uploadedFileUrl,
                                    chatMoodIdx: 4,
                                    status: 0,
                                    startedAt: getCurrentTimestamp,
                                  ),
                                  'participants': (currentUserDocument
                                          ?.groupMembers
                                          ?.toList() ??
                                      []),
                                };
                                var chatsRecordReference =
                                    ChatsRecord.collection.doc();
                                await chatsRecordReference.set(chatsCreateData);
                                lastChat = ChatsRecord.getDocumentFromData(
                                    chatsCreateData, chatsRecordReference);

                                final usersUpdateData = createUsersRecordData(
                                  lastChat: lastChat!.reference,
                                  lastChatStatus: lastChat!.status,
                                );
                                await currentUserReference!
                                    .update(usersUpdateData);
                                triggerPushNotification(
                                  notificationTitle: 'S.O.S.',
                                  notificationText:
                                      txtSOSMessageController!.text,
                                  notificationSound: 'default',
                                  userRefs: (currentUserDocument?.groupMembers
                                              ?.toList() ??
                                          [])
                                      .toList(),
                                  initialPageName: 'HelpChat',
                                  parameterData: {
                                    'chat': lastChat!.reference,
                                  },
                                );
                              }
                              setState(() {
                                txtSOSMessageController?.clear();
                              });
                              context.pushNamed('Chat');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: txtSOSMessageController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Add a message',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Color(0x80000000),
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 300.00,
                                      maxHeight: 150.00,
                                      imageQuality: 51,
                                      allowPhoto: true,
                                      allowVideo: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      pickerFontFamily: 'Inter',
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      final downloadUrls = (await Future.wait(
                                              selectedMedia.map((m) async =>
                                                  await uploadData(
                                                      m.storagePath, m.bytes))))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      if (downloadUrls.length ==
                                          selectedMedia.length) {
                                        setState(() => uploadedFileUrl =
                                            downloadUrls.first);
                                        showUploadMessage(
                                          context,
                                          'Success!',
                                        );
                                      } else {
                                        showUploadMessage(
                                          context,
                                          'Failed to upload media',
                                        );
                                        return;
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
