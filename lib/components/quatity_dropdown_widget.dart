import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quatity_dropdown_model.dart';
export 'quatity_dropdown_model.dart';

class QuatityDropdownWidget extends StatefulWidget {
  const QuatityDropdownWidget({super.key});

  @override
  State<QuatityDropdownWidget> createState() => _QuatityDropdownWidgetState();
}

class _QuatityDropdownWidgetState extends State<QuatityDropdownWidget> {
  late QuatityDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuatityDropdownModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= FFAppState()
            .cart
            .unique((e) => e.quantity)
            .contains(CartItemTypeStruct())
            .toString(),
      ),
      options: const ['delete', '1', '2', '3'],
      onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
      width: 52.0,
      height: 32.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Outfit',
            letterSpacing: 0.0,
          ),
      hintText: '88',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 16.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
