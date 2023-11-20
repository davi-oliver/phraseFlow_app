import 'dart:developer';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phrase_flow/app/global/global_functions.dart';
import 'package:phrase_flow/app/global/routes.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/home/store/home_store.dart';
import 'package:phrase_flow/app/services/questionary/questionary_home/questionary_home_model.dart';
import 'package:phrase_flow/app/services/questionary/questionary_home/questionary_widgets.dart';
import 'package:phrase_flow/app/services/questionary/store/store.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../components/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionarioTipos extends StatefulWidget {
  const QuestionarioTipos({Key? key}) : super(key: key);

  @override
  _QuestionarioTiposState createState() => _QuestionarioTiposState();
}

class _QuestionarioTiposState extends State<QuestionarioTipos> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Inicialize a variável aqui
    init();
  }

  bool initPage = false;

  Future init() async {
    if (initPage) {
      return;
    }
    final questionarioStore =
        Provider.of<QuestionarioStore>(context, listen: false);
    questionarioStore.setControllerPageView(
        await QuestionarioHomeFunctions().initPageController());
    questionarioStore.setSelectedIndex(0);
    calculateProgress(0, questionarioStore.questions.length);
    initPage = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  double calculateProgress(int currentPosition, int listLength) {
    print("O length $listLength.");

    if (currentPosition == 0) {
      return 0;
    }
    if (currentPosition >= 0 && currentPosition < listLength) {
      int totalElementos = listLength;
      double porcentagem = (currentPosition + 1) / totalElementos;

      print(
          "O elemento na posição $currentPosition  representa ${porcentagem.toStringAsFixed(2)}% do total.");
      return porcentagem;
    } else {
      print("O índice fornecido está fora dos limites da lista.");
      return 0.0;
    }
  }

  PreferredSize progressbarLesson() {
    final questionarioStoreT =
        Provider.of<QuestionarioStore>(context, listen: true);
    return PreferredSize(
      preferredSize: Size.fromHeight(120.0),
      child: AppBar(
        backgroundColor: ThemeModeApp.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        actions: [],
        flexibleSpace: FlexibleSpaceBar(
          title: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Observer(builder: (_) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.close,
                                color: ThemeModeApp.of(context).error,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                          Expanded(
                            child: LinearPercentIndicator(
                              percent: calculateProgress(
                                  questionarioStoreT.selectedIndex,
                                  questionarioStoreT.questions.length),
                              lineHeight: 26.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: Color(0xFF1F09E3),
                              backgroundColor: ThemeModeApp.of(context).accent4,
                              center: Text(
                                "${calculateProgress(questionarioStoreT.selectedIndex, questionarioStoreT.questions.length) * 100}%",
                                textAlign: TextAlign.start,
                                style: ThemeModeApp.of(context)
                                    .headlineSmall
                                    .copyWith(
                                      color: calculateProgress(
                                                  questionarioStoreT
                                                      .selectedIndex,
                                                  questionarioStoreT
                                                      .questions.length) >=
                                              0.40
                                          ? ThemeModeApp.of(context)
                                              .primaryBtnText
                                          : ThemeModeApp.of(context)
                                              .primaryText,
                                    ),
                              ),
                              barRadius: Radius.circular(50.0),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
            ],
          ),
          centerTitle: true,
          expandedTitleScale: 1.0,
        ),
        elevation: 0.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final questionarioStoreT =
        Provider.of<QuestionarioStore>(context, listen: true);
    final questionarioStore =
        Provider.of<QuestionarioStore>(context, listen: false);
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => QuestionarioHomeFunctions().unfocusNode.canRequestFocus
          ? FocusScope.of(context)
              .requestFocus(QuestionarioHomeFunctions().unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ThemeModeApp.of(context).secondaryBackground,
        appBar: progressbarLesson(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Observer(builder: (_) {
                return Expanded(
                  child: PageView.builder(
                    controller: questionarioStoreT.controllerPageView,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: questionarioStoreT.questions.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            cardTextTranslate(
                              questionarioStore: questionarioStoreT,
                              index: index,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10, left: 16.0, bottom: 20, right: 16),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .3,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (questionarioStoreT.selectedIndex ==
                                        questionarioStoreT.questions.length -
                                            1) {
                                      if (questionarioStore
                                              .questions[index].answer
                                              .toString()
                                              .toLowerCase() ==
                                          questionarioStore
                                              .controllers[index].text
                                              .toLowerCase()) {
                                        final localLessonCompleted =
                                            await LocalPath().lessonsCompleted;
                                        final localLessonUser =
                                            await LocalPath().lessonsByUser;
                                        // await local.delete();

                                        // verifica se o arquivo lessonsCompleted existe
                                        if (await localLessonCompleted
                                            .exists()) {
                                          // adiciona a lição atual a lista de lições concluídas
                                          await localLessonCompleted
                                              .writeAsString(jsonEncode(
                                                  homeStore.listLessonUser[
                                                      questionarioStoreT
                                                          .indexLesson]));
                                          // mostra o arquivo
                                          log("Arquivo Existe\nadiciona a lição atual a lista de lições concluídas");
                                          print(await localLessonCompleted
                                              .readAsString());
                                        } else if (!await localLessonCompleted
                                            .exists()) {
                                          // cria o arquivo
                                          await localLessonCompleted.create();
                                          // adiciona a lição atual a lista de lições concluídas
                                          await localLessonCompleted
                                              .writeAsString(jsonEncode(
                                                  homeStore.listLessonUser[
                                                      questionarioStoreT
                                                          .indexLesson]));
                                          // mostra o arquivo
                                          log("criou o arquivo e \nadiciona a lição atual a lista de lições concluídas");
                                          print(await localLessonCompleted
                                              .readAsString());
                                        }

                                        // remove do arquivo lessonsByUser a lição atual
                                        if (await localLessonUser.exists()) {
                                          // remove a lição atual da lista de lições do usuário
                                          homeStore.listLessonUser.removeAt(
                                              questionarioStoreT.indexLesson);
                                          // mostra o arquivo
                                          log("Arquivo Existe\nremovendo a lição atual da lista de lições do usuário");
                                          print(await localLessonUser
                                              .readAsString());
                                        } else if (!await localLessonUser
                                            .exists()) {
                                          // cria o arquivo
                                          await localLessonUser.create();
                                          // remove a lição atual da lista de lições do usuário
                                          log("Criou o arquivo e \nremovendo a lição atual da lista de lições do usuário");
                                          homeStore.listLessonUser.removeAt(
                                              questionarioStoreT.indexLesson);
                                          // mostra o arquivo
                                          print(await localLessonUser
                                              .readAsString());
                                        }

                                        // atualiza o arquivo de lições do usuário
                                        await localLessonUser.writeAsString(
                                            jsonEncode(
                                                homeStore.listLessonUser));
                                        // mostra o arquivo
                                        print(await localLessonUser
                                            .readAsString());

                                        // envia para a tela de sucesso
                                        context.pushNamed(successPage);
                                        return;
                                      } else {
                                        log("Resposta digitada: ${questionarioStore.controllers[index].text}");
                                        log("Resposta correta: ${questionarioStore.questions[index].answer}");
                                        await alertErroQuestionUltima(
                                          "A sua resposta inserida não confere com a tradução.Verifique e tente novamente",
                                          () {
                                            Navigator.of(context).pop();
                                            questionarioStore.controllers[index]
                                                .clear();
                                          },
                                        );
                                      }
                                    }

                                    if (questionarioStore
                                            .questions[index].answer
                                            .toString()
                                            .toLowerCase() ==
                                        questionarioStore
                                            .controllers[index].text
                                            .toLowerCase()) {
                                      setState(() {
                                        questionarioStore
                                            .animateControllerPageView();
                                        questionarioStore.controllerPageView
                                            .nextPage(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.fastOutSlowIn);
                                        questionarioStore
                                            .setSelectedIndex(index + 1);
                                      });
                                    } else {
                                      log("Resposta digitada: ${questionarioStore.controllers[index].text}");
                                      log("Resposta correta: ${questionarioStore.questions[index].answer}");
                                      log("é igual ? ${questionarioStore.questions[index].answer.toString().toLowerCase() == questionarioStore.controllers[index].text.toLowerCase()}}");
                                      await alertErroQuestion(
                                          "A sua resposta inserida não confere com a tradução. O que deseja fazer? ",
                                          () {
                                        Navigator.of(context).pop();
                                        questionarioStore.controllers[index]
                                            .clear();
                                      }, () {
                                        Navigator.of(context).pop();

                                        setState(() {
                                          questionarioStore
                                              .animateControllerPageView();
                                          questionarioStore.controllerPageView
                                              .nextPage(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.fastOutSlowIn);
                                          questionarioStore
                                              .setSelectedIndex(index + 1);
                                        });
                                      });
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    decoration: BoxDecoration(
                                      color: Color(0xF313EE0B),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0xF313EE0B),
                                          offset: Offset(0.0, -2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    alignment:
                                        AlignmentDirectional(0.00, -0.35),
                                    child: Text(
                                      "Verificar",
                                      style: ThemeModeApp.of(context)
                                          .headlineMedium
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  alertErroQuestion(
      String texto, Function()? onPressed, Function()? onPressed2) {
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
            "Tentar novamente",
            style: ThemeModeApp.of(context)
                .bodyMedium
                .copyWith(color: ThemeModeApp.of(context).primaryBtnText),
          ),
        ),
        DialogButton(
          color: ThemeModeApp.of(context).secondary,
          radius: BorderRadius.circular(15),
          onPressed: onPressed2,
          child: Text(
            "Pular",
            style: ThemeModeApp.of(context)
                .bodyMedium
                .copyWith(color: ThemeModeApp.of(context).primaryText),
          ),
        ),
      ],
    ).show();
  }

  alertErroQuestionUltima(
    String texto,
    Function()? onPressed,
  ) {
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
            "Fechar",
            style: ThemeModeApp.of(context)
                .bodyMedium
                .copyWith(color: ThemeModeApp.of(context).primaryBtnText),
          ),
        ),
      ],
    ).show();
  }
}
