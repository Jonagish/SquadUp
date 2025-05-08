import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/game_card_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar_with_middle_button/nav_bar_with_middle_button_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'games_joined_model.dart';
export 'games_joined_model.dart';

class GamesJoinedWidget extends StatefulWidget {
  const GamesJoinedWidget({super.key});

  static String routeName = 'Games_Joined';
  static String routePath = '/gamesJoined';

  @override
  State<GamesJoinedWidget> createState() => _GamesJoinedWidgetState();
}

class _GamesJoinedWidgetState extends State<GamesJoinedWidget> {
  late GamesJoinedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamesJoinedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Games_Joined'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GAMES_JOINED_Games_Joined_ON_INIT_STATE');
      logFirebaseEvent('Games_Joined_update_app_state');
      FFAppState().navCondintions = 3;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 500.0,
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: FlutterFlowAdBanner(
                                    height: 60.0,
                                    showsTestAd: true,
                                    iOSAdUnitID:
                                        'ca-app-pub-6369358660566135/9718062556',
                                    androidAdUnitID:
                                        'ca-app-pub-6369358660566135/3344225893',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Joined Games',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 90.0),
                          child: StreamBuilder<List<CreatedGamesRecord>>(
                            stream: queryCreatedGamesRecord(
                              queryBuilder: (createdGamesRecord) =>
                                  createdGamesRecord
                                      .where(
                                        'date_game',
                                        isGreaterThan: getCurrentTimestamp,
                                      )
                                      .where(
                                        'list_players',
                                        arrayContains: currentUserReference,
                                      )
                                      .orderBy('date_game'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<CreatedGamesRecord>
                                  listViewCreatedGamesRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewCreatedGamesRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCreatedGamesRecord =
                                      listViewCreatedGamesRecordList[
                                          listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'GAMES_JOINED_Container_2t0n78hd_ON_TAP');
                                      if (listViewCreatedGamesRecord
                                              .userRef?.id !=
                                          currentUserReference?.id) {
                                        logFirebaseEvent(
                                            'game_card_navigate_to');

                                        context.pushNamed(
                                          DetailsDropoutWidget.routeName,
                                          queryParameters: {
                                            'gameDoc': serializeParam(
                                              listViewCreatedGamesRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'gameDoc':
                                                listViewCreatedGamesRecord,
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .leftToRight,
                                              duration:
                                                  Duration(milliseconds: 200),
                                            ),
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent(
                                            'game_card_navigate_to');

                                        context.pushNamed(
                                          HostDetailsWidget.routeName,
                                          queryParameters: {
                                            'gameDoc': serializeParam(
                                              listViewCreatedGamesRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'gameDoc':
                                                listViewCreatedGamesRecord,
                                          },
                                        );
                                      }
                                    },
                                    child: GameCardWidget(
                                      key: Key(
                                          'Key2t0_${listViewIndex}_of_${listViewCreatedGamesRecordList.length}'),
                                      gamesDoc: listViewCreatedGamesRecord,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  wrapWithModel(
                    model: _model.navBarWithMiddleButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarWithMiddleButtonWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
