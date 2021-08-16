import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/LoginEvent.dart';
import 'package:flutterbloc/bloc/LoginState.dart';
import 'package:flutterbloc/communication/ServerConnection.dart';
import 'package:flutterbloc/validations/ValidationsMixin.dart';
class LoginBloc extends Bloc<LoginEvent,LoginState> with ValidationsMixin,ServerConnection
{
  LoginBloc(LoginState initialState) : super(initialState);

  //By using fat arrow => the curly brackets needs to be removed. ...

  @override
  LoginState get initialize=>LoginState(false, "","","");


  //mapEventToState is called whenever an event is dispatched by the presentation layer. ..
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginEvent)
      {
        if(checkEmptySTring(event.username))
          {
            //yield adds a value to the output stream of the surrounding
            yield LoginState(true, "Enter Username","","");
          }
        else if(checkEmptySTring(event.password))
          {
            yield LoginState(true, "","Enter Password","");
          }
        else
          {
            yield LoginState(true, "","","");
            String data=jsonEncode(<String, String>{
              "secret": "secretkeyhere",
              "publickey": "publickeyhere",
              "Version": "1.0",
              "PlatForm": "Android",
              "Timestamp": "98787878",
              "DeviceToken": "devicetokenhere",
            });

            String response = await loginApi(data);

            yield LoginState(false,"","",response);
          }
      }
  }


}