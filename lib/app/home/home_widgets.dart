import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:phrase_flow/app/global/routes.dart';
import 'package:phrase_flow/app/global/store/global_store.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/home/store/home_store.dart';
import 'package:phrase_flow/app/services/questionary/store/store.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_choice_chips.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:phrase_flow/model/question.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../components/flutter_flow/flutter_flow_util.dart';
import '../../components/flutter_flow/form_field_controller.dart';
import 'home_page.dart' show AcompanhamenttodasatividadesWidget;

class AcompanhamenttodasatividadesModel
    extends FlutterFlowModel<AcompanhamenttodasatividadesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }
}

class HomeWidgets {
  BuildContext context;
  HomeWidgets(this.context);

  Widget filtroProgresso(
    _model,
  ) {
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: double.infinity,
          ),
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Color.fromARGB(255, 32, 32, 32),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filtrar por",
                  style: ThemeModeApp.of(context).labelMedium.copyWith(
                        color: ThemeModeApp.of(context).secondaryText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                FlutterFlowChoiceChips(
                  options: [
                    ChipData("Ativo"),
                    ChipData("Em Andamento"),
                  ],
                  onChanged: (val) =>
                      setState(() => _model.choiceChipsValue = val?.first),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: Color(0x4C39D2C0),
                    textStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                          color: Color(0xFF15161E),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                    iconColor: Color(0xFF15161E),
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderColor: Color(0xFF39D2C0),
                    borderWidth: 1.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFFF1F4F8),
                    textStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                          color: Color(0xFF606A85),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                    iconColor: Color(0xFF606A85),
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderColor: Color(0xFFE5E7EB),
                    borderWidth: 1.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    ["Ativo"],
                  ),
                  wrapped: true,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget atetresidiomas() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Color(0x4D9489F5),
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFF6F61EF),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/197/197560.png',
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Color(0x4D9489F5),
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFF6F61EF),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/197/197593.png',
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ].divide(SizedBox(width: 4.0)),
    );
  }

  Widget botaoAdicionarIdioma() {
    final globalStore = Provider.of<GlobalStore>(context, listen: false);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
      child: FFButtonWidget(
        onPressed: () async {
          if (globalStore.user?.id == null) {
            await alertErro("Complete seu perfil para começar sua trilha", () {
              Navigator.of(context).pop();
              context.pushNamed(updateAccount);
            });

            return;
          }
          print('Button pressed ...');
          context.pushNamed(addLessonPage);
        },
        text: "Adicionar",
        options: FFButtonOptions(
          height: 40.0,
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: Color(0xFF6F61EF),
          textStyle: ThemeModeApp.of(context).titleSmall.copyWith(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
          elevation: 3.0,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  alertErro(String texto, Function()? onPressed) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromLeft,
      isOverlayTapDismiss: false,
      isCloseButton: false,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: ThemeModeApp.of(context).primaryBackground,
        ),
      ),
      titleStyle: ThemeModeApp.of(context).headlineSmall,
      descStyle: ThemeModeApp.of(context).bodyMedium,
      descTextAlign: TextAlign.center,
      isButtonVisible: true,
      overlayColor: Color(0x55000000),
    );

    return Alert(
      context: context,
      style: alertStyle,
      title: "Atenção!",
      desc: texto,
      image: Image.asset("assets/images/error_image.png"),
      buttons: [
        DialogButton(
          color: ThemeModeApp.of(context).primary,
          radius: BorderRadius.circular(15),
          onPressed: onPressed,
          child: Text(
            "Completar cadastro",
            style: ThemeModeApp.of(context)
                .bodyMedium
                .copyWith(color: ThemeModeApp.of(context).primaryBtnText),
          ),
        ),
      ],
    ).show();
  }

  Widget navebarSide() {
    final globalStore = Provider.of<GlobalStore>(context, listen: false);
    return Container(
      width: 270.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: ThemeModeApp.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          color: ThemeModeApp.of(context).lineColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/WhatsApp_Image_2023-08-31_at_21.37.07-removebg-preview.png',
                      width: 73.0,
                      height: 73.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      "PhraseFlow",
                      style: ThemeModeApp.of(context).headlineMedium.copyWith(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 12.0,
              thickness: 2.0,
              color: ThemeModeApp.of(context).primaryBackground,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                      child: Text(
                        "Ferramentas",
                        style: ThemeModeApp.of(context).bodyMedium.copyWith(
                              color: ThemeModeApp.of(context).primaryText,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    globalStore.indexPage == 1
                        ? ItemCardMenuSelect(
                            icon: Icons.home_sharp,
                            title: "Inicio",
                            onTap: () {
                              globalStore.setIndexPage(1);
                              context
                                  .pushNamed("$acompanhamenttodasatividades");
                            },
                            context: context)
                        : ItemCardMenu(
                            context: context,
                            title: "Inicio",
                            icon: Icons.home_sharp,
                            onTap: () {
                              globalStore.setIndexPage(1);
                              context
                                  .pushNamed("$acompanhamenttodasatividades");
                            },
                            index: 1),
                    globalStore.indexPage == 2
                        ? ItemCardMenuSelect(
                            icon: Icons.chat_bubble_sharp,
                            title: "Chats",
                            onTap: () {
                              globalStore.setIndexPage(2);
                              context.pushNamed("$chatPage");
                            },
                            context: context)
                        : ItemCardMenu(
                            context: context,
                            title: "Chats",
                            icon: Icons.chat_bubble_sharp,
                            onTap: () {
                              globalStore.setIndexPage(2);
                              context.pushNamed("$chatPage");
                            },
                            index: 2),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Configurações",
                        style: ThemeModeApp.of(context).labelMedium.copyWith(
                              color: ThemeModeApp.of(context).primaryText,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    globalStore.indexPage == 3
                        ? ItemCardMenuSelect(
                            icon: Icons.attach_money_rounded,
                            title: "Plano Atual",
                            onTap: () {
                              globalStore.setIndexPage(3);
                              context.pushNamed("$planoPage");
                            },
                            context: context)
                        : ItemCardMenu(
                            context: context,
                            title: "Plano Atual",
                            icon: Icons.attach_money_rounded,
                            onTap: () {
                              globalStore.setIndexPage(3);
                              context.pushNamed("$planoPage");
                            },
                            index: 3),
                    globalStore.indexPage == 4
                        ? ItemCardMenuSelect(
                            icon: Icons.settings_outlined,
                            title: "Configurações e Privacidade",
                            onTap: () {
                              globalStore.setIndexPage(4);
                              context.pushNamed("$profile04");
                            },
                            context: context)
                        : ItemCardMenu(
                            context: context,
                            title: "Configurações e Privacidade",
                            icon: Icons.settings_outlined,
                            onTap: () {
                              globalStore.setIndexPage(4);
                              context.pushNamed("$profile04");
                            },
                            index: 3),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ),
            Divider(
              height: 12.0,
              thickness: 2.0,
              color: ThemeModeApp.of(context).lineColor,
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed("$profile04");
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0x4D9489F5),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFF6F61EF),
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                'https://images.unsplash.com/photo-1624561172888-ac93c696e10c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                            width: 44.0,
                            height: 44.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              globalStore.user?.name ?? "Nome do Usuário",
                              style:
                                  ThemeModeApp.of(context).bodyLarge.copyWith(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                            Text(
                              globalStore.user?.email! ?? "Email do Usuário",
                              style:
                                  ThemeModeApp.of(context).labelMedium.copyWith(
                                        color: Color(0xFF606A85),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.menu_open_rounded,
                    color: Color(0xFF606A85),
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCardMenu extends StatelessWidget {
  ItemCardMenu({
    Key? key,
    required this.context,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  String title;
  IconData icon;
  void Function()? onTap;
  int index;

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: 44.0,
          decoration: BoxDecoration(
            color:
                ThemeModeApp.of(context).secondaryBackground.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 6.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: ThemeModeApp.of(context).primary,
                  size: 24.0,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    title,
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCardMenuSelect extends StatelessWidget {
  ItemCardMenuSelect({
    Key? key,
    required this.context,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  String title;
  IconData icon;
  void Function()? onTap;

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: 44.0,
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primary.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 6.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: ThemeModeApp.of(context).primaryBackground,
                  size: 24.0,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    title,
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CorpoHomePage extends StatefulWidget {
  const CorpoHomePage({super.key, required this.model});
  final AcompanhamenttodasatividadesModel model;
  @override
  State<CorpoHomePage> createState() => _CorpoHomePageState();
}

class _CorpoHomePageState extends State<CorpoHomePage> {
  @override
  Widget build(BuildContext context) {
    final globalStore = Provider.of<GlobalStore>(context, listen: false);
    return Align(
      alignment: AlignmentDirectional(0.00, -1.00),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 1170.0,
        ),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 0.0, 0.0),
                            child: Text(
                              "Olá, ${globalStore.user?.name! ?? "Nome"} ",
                              style: ThemeModeApp.of(context)
                                  .headlineMedium
                                  .copyWith(
                                    color: ThemeModeApp.of(context).primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 4.0, 0.0, 0.0),
                            child: Text(
                              "Seus idiomas",
                              textAlign: TextAlign.start,
                              style: ThemeModeApp.of(context)
                                  .labelMedium
                                  .copyWith(
                                    color:
                                        ThemeModeApp.of(context).secondaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      HomeWidgets(context).atetresidiomas(),
                    HomeWidgets(context).botaoAdicionarIdioma(),
                  ],
                ),
              ),
              HomeWidgets(context).filtroProgresso(widget.model),
              if (responsiveVisibility(
                  context: context, phone: false, tablet: false))
                HomePageLandScapeDesktop(),
              if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: false,
                tabletLandscape: false,
              ))
                HomePageTablet(),
              // // mobile
              if (responsiveVisibility(
                context: context,
                tablet: false,
                desktop: false,
                tabletLandscape: false,
              ))
                HomePageMobile(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageLandScapeDesktop extends StatelessWidget {
  const HomePageLandScapeDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeStoreT = Provider.of<HomeStore>(context, listen: true);
    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: homeStoreT.listLessonUser.isEmpty
            ? Center(
                child: Text(
                "Nenhuma lição encontrada",
                style: ThemeModeApp.of(context).bodyMedium.copyWith(
                      color: ThemeModeApp.of(context).primaryText,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
              ))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: homeStoreT.listLessonUser.length,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return CardWeb(
                    title: homeStoreT.listLessonUser[index].title,
                    content: homeStoreT.listLessonUser[index].content,
                    index: index,
                  );
                },
              ),
      );
    });
  }
}

class HomePageTablet extends StatelessWidget {
  const HomePageTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeStore = Provider.of<HomeStore>(context, listen: false);

    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: homeStore.listLessonUser.isEmpty
            ? Center(
                child: Text(
                "Nenhuma lição encontrada",
                style: ThemeModeApp.of(context).bodyMedium.copyWith(
                      color: ThemeModeApp.of(context).primaryText,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
              ))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.5,
                ),
                itemCount: homeStore.listLessonUser.length,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return CardWeb(
                    title: homeStore.listLessonUser[index].title,
                    content: homeStore.listLessonUser[index].content,
                    index: index,
                  );
                },
              ),
      );
    });
  }
}

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeStore = Provider.of<HomeStore>(context, listen: true);

    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: homeStore.listLessonUser.isEmpty
            ? Center(
                child: Text(
                "Nenhuma lição encontrada",
                style: ThemeModeApp.of(context).bodyMedium.copyWith(
                      color: ThemeModeApp.of(context).primaryText,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
              ))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.5,
                ),
                itemCount: homeStore.listLessonUser.length,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return CardMobile(
                    titulo: homeStore.listLessonUser[index].title,
                    conteudo: homeStore.listLessonUser[index].content,
                  );
                },
              ),
      );
    });
  }
}

class CardWeb extends StatelessWidget {
  CardWeb(
      {super.key,
      required this.title,
      required this.content,
      required this.index});

  var title;
  var content;
  int index;

  @override
  Widget build(BuildContext context) {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    final questionarioStore =
        Provider.of<QuestionarioStore>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          color: ThemeModeApp.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Color.fromARGB(57, 105, 102, 102),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x3A000000),
              offset: Offset(0.0, 2.0),
            )
          ]),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 10.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            questionarioStore.clearQuestion();
            for (var element
                in homeStore.listLessonUser[index].lessonQuestions!) {
              questionarioStore.addQuestionByModel(ModelQuestion(
                answer: element.question?.answer,
                question: element.question?.question,
                type: element.question?.type,
                createdAt: element.createdAt,
                updatedAt: element.updatedAt,
              ));
            }
            questionarioStore.setIndexLesson(index);
            log("Adicionou as questoes da licção ao store de questionario ${questionarioStore.questions.length}");
            context.pushNamed('$questionaryTypeWriteWidget');
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
                child: RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Idioma:",
                        style: ThemeModeApp.of(context).bodyLarge,
                      ),
                      TextSpan(
                        text: "$title",
                        style: TextStyle(
                          color: Color(0xFF6F61EF),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                    style: ThemeModeApp.of(context).bodyLarge.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, .0, 10.0),
                child: Text(
                  "$content",
                  textAlign: TextAlign.start,
                  style: ThemeModeApp.of(context).headlineSmall,
                ),
              ),
              Divider(
                height: 2.0,
                thickness: 1.0,
                color: Color(0xFFE5E7EB),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF6F61EF),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 2.0, 2.0, 2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Image.asset(
                                'assets/images/app_launcher_icon.png',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF6F61EF),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 2.0, 2.0, 2.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Icon(
                                  Icons.g_translate_rounded,
                                  color: ThemeModeApp.of(context).primary,
                                )),
                          ),
                        ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerMobile extends StatelessWidget {
  const DividerMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: 500.0,
        constraints: BoxConstraints(
          maxWidth: 570.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Color(0xFFE5E7EB),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

class CardMobile extends StatelessWidget {
  CardMobile({
    super.key,
    required this.titulo,
    required this.conteudo,
  });

  var titulo;
  var conteudo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: 300.0,
        constraints: BoxConstraints(
          maxWidth: 570.0,
        ),
        decoration: BoxDecoration(
          color: ThemeModeApp.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Color(0xFFE5E7EB),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('$questionaryTypeWriteWidget');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 8.0),
                  child: RichText(
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Idioma:",
                          style: ThemeModeApp.of(context).bodyLarge,
                        ),
                        TextSpan(
                            text: "${titulo ?? "Nome do Idioma"}",
                            style: ThemeModeApp.of(context).bodyLarge.copyWith(
                                color: ThemeModeApp.of(context).primary))
                      ],
                      style: ThemeModeApp.of(context).bodyLarge.copyWith(
                            color: Color(0xFF15161E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Text(
                    "$conteudo 1",
                    textAlign: TextAlign.end,
                    style: ThemeModeApp.of(context).headlineSmall.copyWith(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Divider(
                  height: 2.0,
                  thickness: 1.0,
                  color: Color(0xFFE5E7EB),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0x4D9489F5),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF6F61EF),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 2.0, 2.0, 2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/197/197560.png',
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Container(
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: Color(0x4D9489F5),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFF6F61EF),
                            width: 2.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Text(
                              "Acessar",
                              style:
                                  ThemeModeApp.of(context).bodyMedium.copyWith(
                                        color: Color(0xFF6F61EF),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
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
    );
  }
}
