import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AllIsOKWidget extends StatefulWidget {
  const AllIsOKWidget({Key? key}) : super(key: key);

  @override
  _AllIsOKWidgetState createState() => _AllIsOKWidgetState();
}

class _AllIsOKWidgetState extends State<AllIsOKWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x922DED63),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.handHoldingHeart,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          Text(
            'All is sorted out!',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          Text(
            'Good job!',
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Inter',
                  color: Color(0xA3000000),
                ),
          ),
        ],
      ),
    );
  }
}
