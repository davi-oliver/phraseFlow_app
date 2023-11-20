import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phrase_flow/app/global/global_functions.dart';
import 'package:phrase_flow/app/global/store/global_store.dart';
import 'package:phrase_flow/model/user.dart';
import 'package:provider/provider.dart';

class LoginFunctions {
  BuildContext context;
  LoginFunctions(this.context);
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  bool validadeDataNasc(String date) {
    var split = date.split('/');
    var splitToDate = split[2] + '-' + split[1] + '-' + split[0];
    var dataNasc = DateTime.parse(splitToDate);
    var dataAtual = DateTime.now();
    var diferenca = dataAtual.difference(dataNasc).inDays;
    if (diferenca < 3650) {
      log("diferenca: $diferenca");
      return false;
    }
    log("diferenca: $diferenca");

    return true;
  }

  Future<bool> signInGoogle() async {
    final globalInfo = Provider.of<GlobalStore>(context, listen: false);
    final auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    bool resultadoConexao = await VerificaInternet().result(context);

    if (resultadoConexao == false) {
      try {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential user = await auth.signInWithCredential(credential);
        print("signed in " + "${user.user!.displayName}");

        // final tokenResultId = await user.user!.getIdTokenResult();

        // print("TokenResultId = ${tokenResultId}");
        // userInfos.tokenId = tokenResultId.token;
        // log("TokenId = ${userInfos.tokenId}");

        // await getDados();
        // Loading().loadingPadrao("Aguarde");
        globalInfo.setUser(ModelUser(
            name: user.user!.displayName!,
            email: user.user!.email!,
            password: "",
            birthDate: "",
            country: "",
            sex: ""));
      } on Exception catch (e) {
        print("ta dando ruim!!!!!!!! $e");

        return false;
      }
    } else {
      print("Erro ao tentar logar!");
      return false;
    }

    return true;
  }
}
