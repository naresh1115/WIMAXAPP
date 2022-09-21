import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PostdetailWidget extends StatefulWidget {
  const PostdetailWidget({
    Key? key,
    this.postDocRef,
  }) : super(key: key);

  final DocumentReference? postDocRef;

  @override
  _PostdetailWidgetState createState() => _PostdetailWidgetState();
}

class _PostdetailWidgetState extends State<PostdetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.postDocRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitFoldingCube(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final postdetailPostsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).btnText,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
            ),
            title: Text(
              postdetailPostsRecord.title!,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: FlutterFlowTheme.of(context).title1Family,
                    color: FlutterFlowTheme.of(context).btnText,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).title1Family),
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Color(0x2F1D2429),
                            offset: Offset(0, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          postdetailPostsRecord.title!,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF101213),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle1Family),
                                              ),
                                        ),
                                        Divider(
                                          height: 16,
                                          thickness: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                        AutoSizeText(
                                          postdetailPostsRecord.content!
                                              .maybeHandleOverflow(
                                                  maxChars: 500),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF101213),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2Family),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: Image.network(
                                    postdetailPostsRecord.image!,
                                    width: 300,
                                    height: 250,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Color(0x2F1D2429),
                            offset: Offset(0, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder<List<CommentsRecord>>(
                              stream: queryCommentsRecord(
                                parent: widget.postDocRef,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitFoldingCube(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<CommentsRecord>
                                    listViewCommentsRecordList = snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewCommentsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewCommentsRecord =
                                        listViewCommentsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 7),
                                      child: Container(
                                        width: double.infinity,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 7,
                                              color: Color(0x2F1D2429),
                                              offset: Offset(0, 3),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 16, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewCommentsRecord.content!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2Family),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
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
          ),
        );
      },
    );
  }
}
