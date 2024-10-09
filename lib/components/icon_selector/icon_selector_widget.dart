import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'icon_selector_model.dart';
export 'icon_selector_model.dart';

class IconSelectorWidget extends StatefulWidget {
  const IconSelectorWidget({
    super.key,
    required this.currentItem,
    required this.currentColour,
  });

  final String? currentItem;
  final Color? currentColour;

  @override
  State<IconSelectorWidget> createState() => _IconSelectorWidgetState();
}

class _IconSelectorWidgetState extends State<IconSelectorWidget>
    with TickerProviderStateMixin {
  late IconSelectorModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconSelectorModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: const Offset(-1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: const Offset(-1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: const Offset(-1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: const Offset(-1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 0.0),
        children: [
          if (widget.currentItem == 'Home')
            Icon(
              Icons.home_outlined,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveItem
                    ? widget.currentColour
                    : FlutterFlowTheme.of(context).secondaryText,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 32.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation1']!),
          if (widget.currentItem == 'Search')
            Icon(
              Icons.find_in_page_outlined,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveItem
                    ? widget.currentColour
                    : FlutterFlowTheme.of(context).secondaryText,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 32.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
          if (widget.currentItem == 'Categories')
            Icon(
              Icons.card_travel_rounded,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveItem
                    ? widget.currentColour
                    : FlutterFlowTheme.of(context).secondaryText,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 32.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation3']!),
          if (widget.currentItem == 'Setting')
            Icon(
              Icons.settings_outlined,
              color: valueOrDefault<Color>(
                widget.currentItem == FFAppState().menuActiveItem
                    ? widget.currentColour
                    : FlutterFlowTheme.of(context).secondaryText,
                FlutterFlowTheme.of(context).secondaryText,
              ),
              size: 32.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation4']!),
        ],
      ),
    );
  }
}
