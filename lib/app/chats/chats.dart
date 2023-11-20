import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/home/home_page.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_util.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  late AcompanhamenttodasatividadesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  init() async {
    final pageControlerAux = PageController(initialPage: 0);
  }

  @override
  void initState() {
    super.initState();
    init();
    _model = createModel(context, () => AcompanhamenttodasatividadesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ThemeModeApp.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                HomeWidgets(context).navebarSide(),
              if (responsiveVisibility(
                context: context,
              ))
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 1170.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Center(
                          child: Text(
                        "404 - Page Not Found",
                        style: ThemeModeApp.of(context).headlineSmall,
                      )),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
