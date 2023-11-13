import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/home/home_functions.dart';
import 'package:phrase_flow/app/profile04/profile04_widget.dart';
import 'package:phrase_flow/app/services/add_lesson/add_lesson_page.dart';

import '../../components/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'home_widgets.dart';
export 'home_widgets.dart';

class AcompanhamenttodasatividadesWidget extends StatefulWidget {
  const AcompanhamenttodasatividadesWidget({Key? key}) : super(key: key);

  @override
  _AcompanhamenttodasatividadesWidgetState createState() =>
      _AcompanhamenttodasatividadesWidgetState();
}

class _AcompanhamenttodasatividadesWidgetState
    extends State<AcompanhamenttodasatividadesWidget> {
  late AcompanhamenttodasatividadesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  init() async {
    await HomeFunctions(context).getQuestions();
    await HomeFunctions(context).getAllLessons();
    await HomeFunctions(context).getLessonFindUserId();
    await HomeFunctions(context).getLanguages();

    final pageControlerAux = PageController(initialPage: 0);
    setState(() {
      _pageController = pageControlerAux;
    });
  }

  @override
  void initState() {
    init();
    super.initState();

    _model = createModel(context, () => AcompanhamenttodasatividadesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Widget? _child;

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = AcompanhamenttodasatividadesWidget();
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          break;
        case 1:
          _child = AddLesson();
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          break;
        case 2:
          _child = Profile04Widget();
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ThemeModeApp.of(context).secondaryBackground,
        floatingActionButtonLocation: !responsiveVisibility(
                context: context,
                tablet: false,
                desktop: false,
                tabletLandscape: false)
            ? null
            : FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: !responsiveVisibility(
                context: context, desktop: false, tabletLandscape: false)
            ? null
            : FluidNavBar(
                icons: [
                  FluidNavBarIcon(svgPath: "assets/images/home.svg"),
                  FluidNavBarIcon(svgPath: "assets/images/recentes.svg"),
                  FluidNavBarIcon(svgPath: "assets/images/person.svg"),
                ],
                onChange: _handleNavigationChange,
                style: FluidNavBarStyle(
                    barBackgroundColor: ThemeModeApp.of(context).primary,
                    iconSelectedForegroundColor: Colors.white,
                    iconUnselectedForegroundColor: Colors.white),
              ),
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
                  child: PageView(controller: _pageController, children: [
                    CorpoHomePage(
                      model: _model,
                    ),
                    AddLesson(),
                    Profile04Widget()
                  ]),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
