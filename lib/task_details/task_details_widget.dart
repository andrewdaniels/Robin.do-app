import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class TaskDetailsWidget extends StatefulWidget {
  TaskDetailsWidget({Key key}) : super(key: key);

  @override
  _TaskDetailsWidgetState createState() => _TaskDetailsWidgetState();
}

class _TaskDetailsWidgetState extends State<TaskDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryBlack,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.tertiaryColor,
            size: 24,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(
              Icons.edit_outlined,
              color: FlutterFlowTheme.tertiaryColor,
              size: 28,
            ),
          )
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.darkBG,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.primaryBlack,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '[Task Name]',
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Lexend Deca',
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'This is a description for this task it is really great to have but isn’t necessary.',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          indent: 16,
                          endIndent: 16,
                          color: FlutterFlowTheme.darkBG,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Due',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Lexend Deca',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Monday 4:00pm',
                                  style: FlutterFlowTheme.title2.override(
                                    fontFamily: 'Lexend Deca',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'March 27th',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 250),
                                  reverseDuration: Duration(milliseconds: 250),
                                  child:
                                      NavBarPage(initialPage: 'CompletedTasks'),
                                ),
                              );
                            },
                            text: 'Mark As Complete',
                            options: FFButtonOptions(
                              width: 300,
                              height: 56,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 8,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
