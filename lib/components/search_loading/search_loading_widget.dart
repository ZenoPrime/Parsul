import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'search_loading_model.dart';
export 'search_loading_model.dart';

class SearchLoadingWidget extends StatefulWidget {
  const SearchLoadingWidget({super.key});

  @override
  State<SearchLoadingWidget> createState() => _SearchLoadingWidgetState();
}

class _SearchLoadingWidgetState extends State<SearchLoadingWidget> {
  late SearchLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Lottie.asset(
            'assets/lottie_animations/spinning_ring.json',
            width: 32.0,
            height: 32.0,
            fit: BoxFit.contain,
            animate: true,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Processing specifications...',
                    minFontSize: 20.0,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Raleway',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Text(
                  'Please wait while we process the results.',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ),
        ].divide(const SizedBox(width: 8.0)),
      ),
    );
  }
}
