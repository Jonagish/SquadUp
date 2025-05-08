import '/auth/firebase_auth/auth_util.dart';
import '/components/game_creation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar_with_middle_button_model.dart';
export 'nav_bar_with_middle_button_model.dart';

class NavBarWithMiddleButtonWidget extends StatefulWidget {
  const NavBarWithMiddleButtonWidget({super.key});

  @override
  State<NavBarWithMiddleButtonWidget> createState() =>
      _NavBarWithMiddleButtonWidgetState();
}

class _NavBarWithMiddleButtonWidgetState
    extends State<NavBarWithMiddleButtonWidget> {
  late NavBarWithMiddleButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarWithMiddleButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4C4A4),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(
                          0.0,
                          -10.0,
                        ),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.home_outlined,
                  color: FFAppState().navCondintions == 1
                      ? FlutterFlowTheme.of(context).accent4
                      : Color(0xFF0B0B0B),
                  size: 26.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('NAV_BAR_WITH_MIDDLE_BUTTON_home_outlined');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    GoldenPathWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  logFirebaseEvent('IconButton_update_app_state');
                  FFAppState().navCondintions = 1;
                  safeSetState(() {});
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: FFAppState().navCondintions == 2
                      ? FlutterFlowTheme.of(context).accent4
                      : Color(0xFF0B0B0B),
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('NAV_BAR_WITH_MIDDLE_BUTTON_chat_bubble_o');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    ChatHomeWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: FlutterFlowIconButton(
                      key: ValueKey('MiddleButton_o4yp'),
                      borderColor: Colors.transparent,
                      borderRadius: 4.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'NAV_BAR_WITH_MIDDLE_BUTTON_MiddleButton_');
                        logFirebaseEvent('MiddleButton_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: 680.0,
                                child: GameCreationWidget(
                                  userInfo: currentUserReference!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                    ),
                  ),
                ],
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.favorite_border,
                  color: FFAppState().navCondintions == 3
                      ? FlutterFlowTheme.of(context).accent4
                      : Color(0xFF0B0B0B),
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('NAV_BAR_WITH_MIDDLE_BUTTON_favorite_bord');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    GamesJoinedWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  logFirebaseEvent('IconButton_update_app_state');
                  FFAppState().navCondintions = 3;
                  safeSetState(() {});
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.settings_outlined,
                  color: FFAppState().navCondintions == 4
                      ? FlutterFlowTheme.of(context).accent4
                      : Color(0xFF0B0B0B),
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('NAV_BAR_WITH_MIDDLE_BUTTON_settings_outl');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    SettingsWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  logFirebaseEvent('IconButton_update_app_state');
                  FFAppState().navCondintions = 4;
                  safeSetState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
