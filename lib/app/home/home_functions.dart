import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phrase_flow/app/global/store/global_store.dart';
import 'package:phrase_flow/app/home/store/home_store.dart';
import 'package:phrase_flow/app/services/questionary/store/store.dart';
import 'package:phrase_flow/backend/datasource/get.dart';
import 'package:phrase_flow/backend/datasource/results.dart';
import 'package:provider/provider.dart';

class HomeFunctions {
  BuildContext context;

  HomeFunctions(this.context);

  Future getLanguages() async {
    final store = Provider.of<HomeStore>(context, listen: false);

    final response =
        await GetHttpRequestApp(context).makeGetJsonRequest(url: "languages");
    Results res = await response.fold((l) async {
      log("l descrição ${l.descricao} ");
      final mock = [
        {
          "id": 3,
          "name": "English",
          "createdAt": "2023-11-09T14:16:29.416Z",
          "updatedAt": "2023-11-09T11:16:25.000Z"
        },
        {
          "id": 4,
          "name": "Frances",
          "createdAt": "2023-11-09T14:17:17.650Z",
          "updatedAt": "2023-11-09T14:17:17.650Z"
        },
        {
          "id": 5,
          "name": "Espanhol",
          "createdAt": "2023-11-09T14:17:40.817Z",
          "updatedAt": "2023-11-09T14:17:40.817Z"
        }
      ];
      store.languages = mock;
      return Results(sucess: true, message: "Erro ao buscar questões");
    }, (r) async {
      log("r runtype ${r.runtimeType}");
      final mock = [
        {
          "id": 3,
          "name": "English",
          "createdAt": "2023-11-09T14:16:29.416Z",
          "updatedAt": "2023-11-09T11:16:25.000Z"
        },
        {
          "id": 4,
          "name": "Frances",
          "createdAt": "2023-11-09T14:17:17.650Z",
          "updatedAt": "2023-11-09T14:17:17.650Z"
        },
        {
          "id": 5,
          "name": "Espanhol",
          "createdAt": "2023-11-09T14:17:40.817Z",
          "updatedAt": "2023-11-09T14:17:40.817Z"
        }
      ];
      store.languages = mock;

      return Results(sucess: true, message: "Questões carregadas com sucesso");
    });
    // log(name: "QuestionarioStore", "store: ${store.questions.length}");

    if (res.sucess) return true;
    return false;
  }

  Future getQuestions() async {
    final store = Provider.of<QuestionarioStore>(context, listen: false);

    final response =
        await GetHttpRequestApp(context).makeGetJsonRequest(url: "questions");
    Results res = await response.fold((l) async {
      log("l descrição ${l.descricao} ");
      if (l.code == 0) {
        final map = [
          {
            "id": "cln9ejjtg0000yc5zjcn9x5n5",
            "question": "I love to travel and explore new places.",
            "answer": "Eu amo viajar e explorar novos lugares.",
            "type": "translation",
            "createdAt": "2023-10-02T21:27:40.881Z",
            "updatedAt": "2023-10-02T21:27:40.881Z"
          },
          {
            "id": "cln9ejjth0001yc5zuypsw1k5",
            "question": "The sunsets in this city are breathtaking.",
            "answer": "Os pores do sol nesta cidade são deslumbrantes.",
            "type": "translation",
            "createdAt": "2023-10-02T21:27:40.881Z",
            "updatedAt": "2023-10-02T21:27:40.881Z"
          },
          {
            "id": "cln9ejjth0002yc5zse5phjen",
            "question": "Learning new languages is a rewarding experience.",
            "answer": "Aprender novos idiomas é uma experiência gratificante.",
            "type": "translation",
            "createdAt": "2023-10-02T21:27:40.881Z",
            "updatedAt": "2023-10-02T21:27:40.881Z"
          },
          {
            "id": "clo7fsnsp00001k9rucxqkabq",
            "question": "The weather today is beautiful and sunny.",
            "answer": "O tempo hoje está lindo e ensolarado.",
            "type": "translation",
            "createdAt": "2023-10-26T17:06:56.108Z",
            "updatedAt": "2023-10-26T17:06:56.108Z"
          },
          {
            "id": "clo7fsnwu00011k9r7ofmdg1z",
            "question": "I enjoy reading books in my free time.",
            "answer": "Eu gosto de ler livros no meu tempo livre.",
            "type": "translation",
            "createdAt": "2023-10-26T17:06:56.910Z",
            "updatedAt": "2023-10-26T17:06:56.910Z"
          },
          {
            "id": "clo7fsnyx00021k9rb554gcl5",
            "question": "Can you please pass me the salt and pepper?",
            "answer": "Você pode por favor me passar o sal e a pimenta?",
            "type": "translation",
            "createdAt": "2023-10-26T17:06:56.985Z",
            "updatedAt": "2023-10-26T17:06:56.985Z"
          },
          {
            "id": "clo7fso1000031k9raa6u1wcx",
            "question": "Learning a new language is a rewarding challenge.",
            "answer": "Aprender um novo idioma é um desafio gratificante.",
            "type": "translation",
            "createdAt": "2023-10-26T17:06:57.060Z",
            "updatedAt": "2023-10-26T17:06:57.060Z"
          },
          {
            "id": "clo7fso3300041k9rhtxvw3e7",
            "question": "I need directions to the nearest train station.",
            "answer":
                "Preciso de direções para a estação de trem mais próxima.",
            "type": "translation",
            "createdAt": "2023-10-26T17:06:57.135Z",
            "updatedAt": "2023-10-26T17:06:57.135Z"
          }
        ];
        for (var i = 0; i < map.length; i++) {
          store.addQuestion(map[i]);
        }
      }
      return Results(sucess: false, message: "Erro ao buscar questões");
    }, (r) async {
      // log("r runtype ${r.runtimeType}");

      for (var i = 0; i < r.length; i++) {
        store.addQuestion(r[i]);
      }
      return Results(sucess: true, message: "Questões carregadas com sucesso");
    });
    // log(name: "QuestionarioStore", "store: ${store.questions.length}");

    if (res.sucess) return true;
    return false;
  }

  Future getLessonFindUserId() async {
    final store = Provider.of<HomeStore>(context, listen: false);
    final gstore = Provider.of<GlobalStore>(context, listen: false);
    store.listLessonUser.clear();
    try {
      final response = await GetHttpRequestApp(context).makeGetJsonRequest(
        url: "lessons/user",
        params: "${gstore.user!.id ?? "1"}",
      );
      Results res = await response.fold((l) async {
        log("l descrição ${l.descricao} ");
        if (l.code == 0) {
          final map = [
            {
              "id": "cln9ejjtg0000yc5zjcn9x5n5",
              "question": "I love to travel and explore new places.",
              "answer": "Eu amo viajar e explorar novos lugares.",
              "type": "translation",
              "createdAt": "2023-10-02T21:27:40.881Z",
              "updatedAt": "2023-10-02T21:27:40.881Z"
            },
            {
              "id": "cln9ejjth0001yc5zuypsw1k5",
              "question": "The sunsets in this city are breathtaking.",
              "answer": "Os pores do sol nesta cidade são deslumbrantes.",
              "type": "translation",
              "createdAt": "2023-10-02T21:27:40.881Z",
              "updatedAt": "2023-10-02T21:27:40.881Z"
            },
            {
              "id": "cln9ejjth0002yc5zse5phjen",
              "question": "Learning new languages is a rewarding experience.",
              "answer":
                  "Aprender novos idiomas é uma experiência gratificante.",
              "type": "translation",
              "createdAt": "2023-10-02T21:27:40.881Z",
              "updatedAt": "2023-10-02T21:27:40.881Z"
            },
            {
              "id": "clo7fsnsp00001k9rucxqkabq",
              "question": "The weather today is beautiful and sunny.",
              "answer": "O tempo hoje está lindo e ensolarado.",
              "type": "translation",
              "createdAt": "2023-10-26T17:06:56.108Z",
              "updatedAt": "2023-10-26T17:06:56.108Z"
            },
            {
              "id": "clo7fsnwu00011k9r7ofmdg1z",
              "question": "I enjoy reading books in my free time.",
              "answer": "Eu gosto de ler livros no meu tempo livre.",
              "type": "translation",
              "createdAt": "2023-10-26T17:06:56.910Z",
              "updatedAt": "2023-10-26T17:06:56.910Z"
            },
            {
              "id": "clo7fsnyx00021k9rb554gcl5",
              "question": "Can you please pass me the salt and pepper?",
              "answer": "Você pode por favor me passar o sal e a pimenta?",
              "type": "translation",
              "createdAt": "2023-10-26T17:06:56.985Z",
              "updatedAt": "2023-10-26T17:06:56.985Z"
            },
            {
              "id": "clo7fso1000031k9raa6u1wcx",
              "question": "Learning a new language is a rewarding challenge.",
              "answer": "Aprender um novo idioma é um desafio gratificante.",
              "type": "translation",
              "createdAt": "2023-10-26T17:06:57.060Z",
              "updatedAt": "2023-10-26T17:06:57.060Z"
            },
            {
              "id": "clo7fso3300041k9rhtxvw3e7",
              "question": "I need directions to the nearest train station.",
              "answer":
                  "Preciso de direções para a estação de trem mais próxima.",
              "type": "translation",
              "createdAt": "2023-10-26T17:06:57.135Z",
              "updatedAt": "2023-10-26T17:06:57.135Z"
            }
          ];
          for (var i = 0; i < map.length; i++) {
            store.setListLessonUser(map[i]);
          }
        }
        return Results(sucess: false, message: "Erro ao buscar Lições");
      }, (r) async {
        log("r runtype ${r.runtimeType}");

        for (var i = 0; i < r.length; i++) {
          log("item>> ${r[i]}");
          store.setListLessonUser(r[i]);
        }
        return Results(sucess: true, message: "Lições carregadas com sucesso");
      });
      // log(
      //     name: "HomeStoresetListAllLessons ",
      //     "store: ${store.listLessonUser.length}");
      // log("response>> $response");
      log(
          name: "HomeStoresetListAllLessons ",
          "store: ${store.listLessonUser.first.title} ${store.listLessonUser.first.content}");
      if (res.sucess) return true;
      return false;
    } on Exception catch (e) {
      log(name: "HomeStoresetListAllLessons ", "ERRO: ${e.toString()} ");
      return false;
    }
  }

  Future getAllLessons() async {
    final store = Provider.of<QuestionarioStore>(context, listen: false);
    store.listAllLessons.clear();
    final response = await GetHttpRequestApp(context).makeGetJsonRequest(
      url: "lessons",
    );
    Results res = await response.fold((l) async {
      log("l descrição ${l.descricao} ");
      if (l.code == 0) {
        for (var i = 0; i < mapAllLesson.length; i++) {
          store.setListAllLessons(mapAllLesson[i]);
        }
      }
      return Results(sucess: false, message: "Erro ao buscar Lições");
    }, (r) async {
      // log("r runtype ${r.runtimeType}");

      for (var i = 0; i < r.length; i++) {
        // log("item>> $i");
        store.setListAllLessons(r[i]);
      }
      return Results(sucess: true, message: "Lições carregadas com sucesso");
    });
    // log(name: "QuestionarioStore", "store: ${store.questions.length}");
    // log("response>> $response");
    if (res.sucess) return true;
    return false;
  }

  Future postSubscribeLesson() async {}
}

final mapAllLesson = [
  {
    "id": 2,
    "title": "English 2",
    "content": "My english notes.",
    "createdAt": "2023-11-09T14:22:24.854Z",
    "updatedAt": "2023-11-09T14:22:24.854Z",
    "lessonQuestions": [
      {
        "id": 5,
        "lessonId": 2,
        "questionId": "clora2zla0004ycewetybt4rx",
        "createdAt": "2023-11-09T14:22:24.854Z",
        "updatedAt": "2023-11-09T14:22:24.854Z",
        "question": {
          "id": "clora2zla0004ycewetybt4rx",
          "question": "He plays the guitar in a band.",
          "answer": "Ele toca violão em uma banda.",
          "type": "translation",
          "createdAt": "2023-11-09T14:22:24.287Z",
          "updatedAt": "2023-11-09T14:22:24.287Z"
        }
      },
      {
        "id": 6,
        "lessonId": 2,
        "questionId": "clora2zp90005ycew3bcim42m",
        "createdAt": "2023-11-09T14:22:24.854Z",
        "updatedAt": "2023-11-09T14:22:24.854Z",
        "question": {
          "id": "clora2zp90005ycew3bcim42m",
          "question": "We love watching movies at home.",
          "answer": "Nós adoramos assistir filmes em casa.",
          "type": "translation",
          "createdAt": "2023-11-09T14:22:24.573Z",
          "updatedAt": "2023-11-09T14:22:24.573Z"
        }
      },
      {
        "id": 7,
        "lessonId": 2,
        "questionId": "clora2zt50006ycew3jkwauh8",
        "createdAt": "2023-11-09T14:22:24.854Z",
        "updatedAt": "2023-11-09T14:22:24.854Z",
        "question": {
          "id": "clora2zt50006ycew3jkwauh8",
          "question": "She studies mathematics at the university.",
          "answer": "Ela estuda matemática na universidade.",
          "type": "translation",
          "createdAt": "2023-11-09T14:22:24.713Z",
          "updatedAt": "2023-11-09T14:22:24.713Z"
        }
      }
    ]
  },
  {
    "id": 1,
    "title": "Basic English",
    "content": "Primeira lição de tradução para ingles",
    "createdAt": "2023-11-09T14:19:42.410Z",
    "updatedAt": "2023-11-09T14:19:42.410Z",
    "lessonQuestions": [
      {
        "id": 1,
        "lessonId": 1,
        "questionId": "clor9zi0t0000ycewzv9jz6rf",
        "createdAt": "2023-11-09T14:19:42.410Z",
        "updatedAt": "2023-11-09T14:19:42.410Z",
        "question": {
          "id": "clor9zi0t0000ycewzv9jz6rf",
          "question": "The weather today is beautiful and sunny.",
          "answer": "O tempo hoje está lindo e ensolarado.",
          "type": "translation",
          "createdAt": "2023-11-09T14:19:41.693Z",
          "updatedAt": "2023-11-09T14:19:41.693Z"
        }
      },
      {
        "id": 2,
        "lessonId": 1,
        "questionId": "clor9zi8z0001ycewe9fdvegj",
        "createdAt": "2023-11-09T14:19:42.410Z",
        "updatedAt": "2023-11-09T14:19:42.410Z",
        "question": {
          "id": "clor9zi8z0001ycewe9fdvegj",
          "question": "I enjoy reading books in my free time.",
          "answer": "Eu gosto de ler livros no meu tempo livre.",
          "type": "translation",
          "createdAt": "2023-11-09T14:19:41.988Z",
          "updatedAt": "2023-11-09T14:19:41.988Z"
        }
      },
      {
        "id": 3,
        "lessonId": 1,
        "questionId": "clor9zict0002ycewwqlsh2ke",
        "createdAt": "2023-11-09T14:19:42.410Z",
        "updatedAt": "2023-11-09T14:19:42.410Z",
        "question": {
          "id": "clor9zict0002ycewwqlsh2ke",
          "question": "She drives a red car to work.",
          "answer": "Ela dirige um carro vermelho para o trabalho.",
          "type": "translation",
          "createdAt": "2023-11-09T14:19:42.126Z",
          "updatedAt": "2023-11-09T14:19:42.126Z"
        }
      },
      {
        "id": 4,
        "lessonId": 1,
        "questionId": "clor9zigr0003ycewyls1f8us",
        "createdAt": "2023-11-09T14:19:42.410Z",
        "updatedAt": "2023-11-09T14:19:42.410Z",
        "question": {
          "id": "clor9zigr0003ycewyls1f8us",
          "question": "They cook delicious meals on the weekends.",
          "answer": "Eles cozinham refeições deliciosas nos fins de semana.",
          "type": "translation",
          "createdAt": "2023-11-09T14:19:42.268Z",
          "updatedAt": "2023-11-09T14:19:42.268Z"
        }
      }
    ]
  },
  {
    "id": 3,
    "title": "Frances basico",
    "content": "Lição de frances",
    "createdAt": "2023-11-09T14:24:39.386Z",
    "updatedAt": "2023-11-09T14:24:39.386Z",
    "lessonQuestions": [
      {
        "id": 8,
        "lessonId": 3,
        "questionId": "clora5vaf0007ycewohqh2pmg",
        "createdAt": "2023-11-09T14:24:39.386Z",
        "updatedAt": "2023-11-09T14:24:39.386Z",
        "question": {
          "id": "clora5vaf0007ycewohqh2pmg",
          "question": "J'aime écouter de la musique tous les jours.",
          "answer": "Eu gosto de ouvir música todos os dias.",
          "type": "translation",
          "createdAt": "2023-11-09T14:24:38.681Z",
          "updatedAt": "2023-11-09T14:24:38.681Z"
        }
      },
      {
        "id": 9,
        "lessonId": 3,
        "questionId": "clora5vef0008ycewrrdx6msn",
        "createdAt": "2023-11-09T14:24:39.386Z",
        "updatedAt": "2023-11-09T14:24:39.386Z",
        "question": {
          "id": "clora5vef0008ycewrrdx6msn",
          "question": "Elle parle couramment le français.",
          "answer": "Ela fala francês fluentemente.",
          "type": "translation",
          "createdAt": "2023-11-09T14:24:38.967Z",
          "updatedAt": "2023-11-09T14:24:38.967Z"
        }
      },
      {
        "id": 10,
        "lessonId": 3,
        "questionId": "clora5via0009ycewm679lzq6",
        "createdAt": "2023-11-09T14:24:39.386Z",
        "updatedAt": "2023-11-09T14:24:39.386Z",
        "question": {
          "id": "clora5via0009ycewm679lzq6",
          "question": "Nous visitons des musées le weekend.",
          "answer": "Nós visitamos museus no fim de semana.",
          "type": "translation",
          "createdAt": "2023-11-09T14:24:39.106Z",
          "updatedAt": "2023-11-09T14:24:39.106Z"
        }
      },
      {
        "id": 11,
        "lessonId": 3,
        "questionId": "clora5vm5000aycewsmo9kotr",
        "createdAt": "2023-11-09T14:24:39.386Z",
        "updatedAt": "2023-11-09T14:24:39.386Z",
        "question": {
          "id": "clora5vm5000aycewsmo9kotr",
          "question": "Il prépare un délicieux repas pour sa famille.",
          "answer": "Ele prepara uma refeição deliciosa para a sua família.",
          "type": "translation",
          "createdAt": "2023-11-09T14:24:39.246Z",
          "updatedAt": "2023-11-09T14:24:39.246Z"
        }
      }
    ]
  },
  {
    "id": 4,
    "title": "Frases basicas de frances",
    "content": "Aprenda suas primeiras palavras em frances",
    "createdAt": "2023-11-09T14:25:50.840Z",
    "updatedAt": "2023-11-09T14:25:50.840Z",
    "lessonQuestions": [
      {
        "id": 12,
        "lessonId": 4,
        "questionId": "clora7ebd000bycew5vhmw7n5",
        "createdAt": "2023-11-09T14:25:50.840Z",
        "updatedAt": "2023-11-09T14:25:50.840Z",
        "question": {
          "id": "clora7ebd000bycew5vhmw7n5",
          "question": "Elle étudie l'histoire à l'université.",
          "answer": "Ela estuda história na universidade.",
          "type": "translation",
          "createdAt": "2023-11-09T14:25:49.990Z",
          "updatedAt": "2023-11-09T14:25:49.990Z"
        }
      },
      {
        "id": 13,
        "lessonId": 4,
        "questionId": "clora7efb000cycewow4qovca",
        "createdAt": "2023-11-09T14:25:50.840Z",
        "updatedAt": "2023-11-09T14:25:50.840Z",
        "question": {
          "id": "clora7efb000cycewow4qovca",
          "question": "Ils voyagent en train à travers la France.",
          "answer": "Eles viajam de trem por toda a França.",
          "type": "translation",
          "createdAt": "2023-11-09T14:25:50.279Z",
          "updatedAt": "2023-11-09T14:25:50.279Z"
        }
      },
      {
        "id": 14,
        "lessonId": 4,
        "questionId": "clora7ej8000dycew6mqjevj0",
        "createdAt": "2023-11-09T14:25:50.840Z",
        "updatedAt": "2023-11-09T14:25:50.840Z",
        "question": {
          "id": "clora7ej8000dycew6mqjevj0",
          "question": "Nous aimons regarder des films français.",
          "answer": "Nós adoramos assistir filmes franceses.",
          "type": "translation",
          "createdAt": "2023-11-09T14:25:50.420Z",
          "updatedAt": "2023-11-09T14:25:50.420Z"
        }
      },
      {
        "id": 15,
        "lessonId": 4,
        "questionId": "clora7en3000eycewmba193vi",
        "createdAt": "2023-11-09T14:25:50.840Z",
        "updatedAt": "2023-11-09T14:25:50.840Z",
        "question": {
          "id": "clora7en3000eycewmba193vi",
          "question": "Il joue du piano dans un groupe de musique.",
          "answer": "Ele toca piano em uma banda de música.",
          "type": "translation",
          "createdAt": "2023-11-09T14:25:50.560Z",
          "updatedAt": "2023-11-09T14:25:50.560Z"
        }
      },
      {
        "id": 16,
        "lessonId": 4,
        "questionId": "clora7eqy000fycewxan5xli6",
        "createdAt": "2023-11-09T14:25:50.840Z",
        "updatedAt": "2023-11-09T14:25:50.840Z",
        "question": {
          "id": "clora7eqy000fycewxan5xli6",
          "question": "Elle danse avec grâce lors de spectacles.",
          "answer": "Ela dança com graciosidade em espetáculos.",
          "type": "translation",
          "createdAt": "2023-11-09T14:25:50.699Z",
          "updatedAt": "2023-11-09T14:25:50.699Z"
        }
      }
    ]
  }
];
