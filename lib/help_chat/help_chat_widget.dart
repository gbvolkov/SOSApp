import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class HelpChatWidget extends StatefulWidget {
  const HelpChatWidget({
    Key? key,
    this.chat,
  }) : super(key: key);

  final DocumentReference? chat;

  @override
  _HelpChatWidgetState createState() => _HelpChatWidgetState();
}

class _HelpChatWidgetState extends State<HelpChatWidget> {
  MessagesRecord? lastMessage;
  String uploadedFileUrl = '';
  TextEditingController? txtMessageController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    txtMessageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF3E494A),
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('Home');
          },
        ),
        title: Text(
          'Help you mates!',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<ChatsRecord>(
            stream: ChatsRecord.getDocument(widget.chat!),
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
              final stackChatsRecord = snapshot.data!;
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: custom_widgets.MoodContainerWidget(
                      width: double.infinity,
                      height: 200,
                      moodIndex: stackChatsRecord.chatMoodIdx,
                      moodColors: FFAppState().sliderColors.toList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    stackChatsRecord.initiator!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final contWreckedPersonUsersRecord =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              contWreckedPersonUsersRecord
                                                  .photoUrl,
                                              'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/toonified.jpg?alt=media&token=afd96af7-96a9-4200-9c79-4bc73fe496ae',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: Text(
                                                    contWreckedPersonUsersRecord
                                                        .displayName!,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: custom_widgets
                                                      .MarkdownWidget(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    mdText: stackChatsRecord
                                                        .chatMessage!,
                                                    txtColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    linkColor:
                                                        Color(0xFF0066FA),
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            stackChatsRecord.chatImage,
                                            'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/1916128-untitled-1550822623.png?alt=media&token=de312d3c-854f-4f86-b045-6ea11612b96e',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: valueOrDefault<String>(
                                          stackChatsRecord.chatImage,
                                          'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/1916128-untitled-1550822623.png?alt=media&token=de312d3c-854f-4f86-b045-6ea11612b96e',
                                        ),
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: valueOrDefault<String>(
                                    stackChatsRecord.chatImage,
                                    'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/1916128-untitled-1550822623.png?alt=media&token=de312d3c-854f-4f86-b045-6ea11612b96e',
                                  ),
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        stackChatsRecord.chatImage,
                                        'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/1916128-untitled-1550822623.png?alt=media&token=de312d3c-854f-4f86-b045-6ea11612b96e',
                                      ),
                                      width: double.infinity,
                                      height: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 280,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: StreamBuilder<List<MessagesRecord>>(
                                    stream: queryMessagesRecord(
                                      queryBuilder: (messagesRecord) =>
                                          messagesRecord
                                              .where('chat',
                                                  isEqualTo: widget.chat)
                                              .orderBy('created',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<MessagesRecord>
                                          lvMessagesMessagesRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            lvMessagesMessagesRecordList.length,
                                        itemBuilder:
                                            (context, lvMessagesIndex) {
                                          final lvMessagesMessagesRecord =
                                              lvMessagesMessagesRecordList[
                                                  lvMessagesIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (lvMessagesMessagesRecord
                                                      .sender !=
                                                  stackChatsRecord.initiator)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 5, 120, 10),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(24),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(24),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  lvMessagesMessagesRecord
                                                                      .sender!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final rowUsersRecord =
                                                                snapshot.data!;
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        rowUsersRecord
                                                                            .photoUrl,
                                                                        'https://firebasestorage.googleapis.com/v0/b/sosapp-8fe3c.appspot.com/o/toonified.jpg?alt=media&token=afd96af7-96a9-4200-9c79-4bc73fe496ae',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        custom_widgets
                                                                            .MarkdownWidget(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              40,
                                                                          mdText:
                                                                              lvMessagesMessagesRecord.messageBody!,
                                                                          txtColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          linkColor:
                                                                              Color(0xFF0066FA),
                                                                          fontSize:
                                                                              20.0,
                                                                        ),
                                                                        Text(
                                                                          rowUsersRecord
                                                                              .email!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      5, 5, 5),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      lvMessagesMessagesRecord
                                                                          .image!,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: lvMessagesMessagesRecord
                                                                        .image!,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  lvMessagesMessagesRecord
                                                                      .image!,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          24),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          24),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  lvMessagesMessagesRecord
                                                                      .image!,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 100,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              if (lvMessagesMessagesRecord
                                                      .sender ==
                                                  stackChatsRecord.initiator)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(120, 5, 20, 10),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(24),
                                                        topLeft:
                                                            Radius.circular(24),
                                                        topRight:
                                                            Radius.circular(0),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: Stack(
                                                        children: [
                                                          custom_widgets
                                                              .MoodContainerWidget(
                                                            width:
                                                                double.infinity,
                                                            height: 80,
                                                            moodIndex:
                                                                lvMessagesMessagesRecord
                                                                    .moodIdx,
                                                            moodColors:
                                                                FFAppState()
                                                                    .sliderColors
                                                                    .toList(),
                                                            borderRadius: 16.0,
                                                          ),
                                                          StreamBuilder<
                                                              UsersRecord>(
                                                            stream: UsersRecord
                                                                .getDocument(
                                                                    lvMessagesMessagesRecord
                                                                        .sender!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final rowUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              custom_widgets.MarkdownWidget(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                40,
                                                                            mdText:
                                                                                lvMessagesMessagesRecord.messageBody!,
                                                                            txtColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            linkColor:
                                                                                Color(0xFF0066FA),
                                                                            fontSize:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  child: FlutterFlowExpandedImageView(
                                                                                    image: Image.network(
                                                                                      lvMessagesMessagesRecord.image!,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                    allowRotation: false,
                                                                                    tag: lvMessagesMessagesRecord.image!,
                                                                                    useHeroAnimation: true,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Hero(
                                                                              tag: lvMessagesMessagesRecord.image!,
                                                                              transitionOnUserGestures: true,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0),
                                                                                  bottomRight: Radius.circular(24),
                                                                                  topLeft: Radius.circular(24),
                                                                                  topRight: Radius.circular(0),
                                                                                ),
                                                                                child: Image.network(
                                                                                  lvMessagesMessagesRecord.image!,
                                                                                  width: double.infinity,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: txtMessageController,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
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
                                                        m.storagePath,
                                                        m.bytes))))
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
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.send_outlined,
                                      color: Color(0x80000000),
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      if (stackChatsRecord.status == 0) {
                                        final messagesCreateData = {
                                          ...createMessagesRecordData(
                                            messageBody:
                                                txtMessageController!.text,
                                            created: getCurrentTimestamp,
                                            moodIdx: 0,
                                            sender: currentUserReference,
                                            image: uploadedFileUrl,
                                            chat: currentUserDocument!.lastChat,
                                          ),
                                          'recipients': stackChatsRecord
                                              .participants!
                                              .toList(),
                                        };
                                        var messagesRecordReference =
                                            MessagesRecord.collection.doc();
                                        await messagesRecordReference
                                            .set(messagesCreateData);
                                        lastMessage =
                                            MessagesRecord.getDocumentFromData(
                                                messagesCreateData,
                                                messagesRecordReference);
                                        setState(() {
                                          txtMessageController?.clear();
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'The chat is complete.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            action: SnackBarAction(
                                              label: 'S.O.S.',
                                              textColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              onPressed: () async {
                                                context.goNamed('SOS');
                                              },
                                            ),
                                          ),
                                        );
                                      }

                                      setState(() {});
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
              );
            },
          ),
        ),
      ),
    );
  }
}
