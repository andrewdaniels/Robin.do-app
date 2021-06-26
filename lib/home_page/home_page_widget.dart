import '../backend/backend.dart';
import '../components/create_task_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../task_details/task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My Tasks',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.darkBG,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 440,
                  child: CreateTaskWidget(),
                );
              });
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add_rounded,
          color: FlutterFlowTheme.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/waves@2x.png',
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  fit: BoxFit.cover,
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<ToDoListRecord>>(
                        stream: queryToDoListRecord(
                          queryBuilder: (toDoListRecord) => toDoListRecord
                              .orderBy('toDoDate', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          List<ToDoListRecord> columnToDoListRecordList =
                              snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (columnToDoListRecordList.isEmpty) {
                            return Center(
                              child: Image.asset(
                                'assets/images/uiList_Empty@3x.png',
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                            );
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnToDoListRecordList.length, (columnIndex) {
                              final columnToDoListRecord =
                                  columnToDoListRecordList[columnIndex];
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.92,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.primaryBlack,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TaskDetailsWidget(),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment(0.9, 0),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                final toDoState =
                                                    !columnToDoListRecord
                                                        .toDoState;

                                                final toDoListRecordData =
                                                    createToDoListRecordData(
                                                  toDoState: toDoState,
                                                );

                                                await columnToDoListRecord
                                                    .reference
                                                    .update(toDoListRecordData);
                                              },
                                              value: columnToDoListRecord
                                                  .toDoState,
                                              onIcon: Icon(
                                                Icons.radio_button_off_sharp,
                                                color: FlutterFlowTheme.darkBG,
                                                size: 25,
                                              ),
                                              offIcon: Icon(
                                                Icons.check_circle_rounded,
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                                size: 25,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(-0.8, -0.4),
                                            child: Text(
                                              '[Task Name]',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.title2
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(-0.85, 0.5),
                                            child: Text(
                                              'Due:',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.bodyText2
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(-0.65, 0.5),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 0, 0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'MMMEd',
                                                    columnToDoListRecord
                                                        .toDoDate),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
