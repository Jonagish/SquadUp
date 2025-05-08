import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/game_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'map_view_copy_model.dart';
export 'map_view_copy_model.dart';

class MapViewCopyWidget extends StatefulWidget {
  const MapViewCopyWidget({super.key});

  static String routeName = 'mapViewCopy';
  static String routePath = '/mapViewCopy';

  @override
  State<MapViewCopyWidget> createState() => _MapViewCopyWidgetState();
}

class _MapViewCopyWidgetState extends State<MapViewCopyWidget>
    with TickerProviderStateMixin {
  late MapViewCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapViewCopyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mapViewCopy'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'MAP_VIEW_COPY_PAGE_arrow_back_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.safePop();
                          },
                        ),
                        Text(
                          'Return',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        StreamBuilder<List<CreatedGamesRecord>>(
                          stream: queryCreatedGamesRecord(
                            queryBuilder: (createdGamesRecord) =>
                                createdGamesRecord
                                    .where(
                                      'date_game',
                                      isGreaterThanOrEqualTo:
                                          getCurrentTimestamp,
                                    )
                                    .where(
                                      'sport',
                                      isEqualTo:
                                          FFAppState().sportTypeFILTER != ''
                                              ? FFAppState().sportTypeFILTER
                                              : null,
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
                                googleMapCreatedGamesRecordList =
                                snapshot.data!;

                            return FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) =>
                                  _model.googleMapsCenter = latLng,
                              initialLocation: _model.googleMapsCenter ??=
                                  currentUserLocationValue!,
                              markers: googleMapCreatedGamesRecordList
                                  .map(
                                    (marker) => FlutterFlowMarker(
                                      marker.reference.path,
                                      marker.location!,
                                      () async {
                                        logFirebaseEvent(
                                            'MAP_VIEW_COPY_GoogleMap_72w5czj7_ON_MARK');
                                        logFirebaseEvent(
                                            'GoogleMap_update_page_state');
                                        _model.docGames = marker;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'GoogleMap_widget_animation');
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      },
                                    ),
                                  )
                                  .toList(),
                              markerColor: GoogleMarkerColor.orange,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 14.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: false,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            );
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: PointerInterceptor(
                            intercepting: isWeb,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 25.0),
                              child: Container(
                                height: 170.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 12.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'MAP_VIEW_COPY_PAGE_Icon_wmszjgbs_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_widget_animation');
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation'] !=
                                                    null) {
                                                  await animationsMap[
                                                          'containerOnActionTriggerAnimation']!
                                                      .controller
                                                      .reverse();
                                                }
                                              },
                                              child: Icon(
                                                Icons.close,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MAP_VIEW_COPY_Container_yiwjpoex_ON_TAP');
                                        if (_model.docGames?.userRef !=
                                            currentUserReference) {
                                          logFirebaseEvent(
                                              'game_card_navigate_to');

                                          context.pushNamed(
                                            DetailsJoinPageWidget.routeName,
                                            queryParameters: {
                                              'gameDoc': serializeParam(
                                                _model.docGames,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'gameDoc': _model.docGames,
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
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
                                                _model.docGames,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'gameDoc': _model.docGames,
                                            },
                                          );
                                        }
                                      },
                                      child: wrapWithModel(
                                        model: _model.gameCardModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: GameCardWidget(
                                          gamesDoc: _model.docGames!,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation']!,
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
      ),
    );
  }
}
