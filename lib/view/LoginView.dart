import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/BaseClass.dart';
import 'package:flutterbloc/bloc/LoginBloc.dart';
import 'package:flutterbloc/bloc/LoginEvent.dart';
import 'package:flutterbloc/bloc/LoginState.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView>  {

  //Declaration of variables that will be initialize later is done using late modifier
  late LoginBloc _loginBloc;
  late BaseClass _baseClass;
  late TextEditingController _usernameController,_passordcontroller;

  @override
  void initState()
  {
    _loginBloc=LoginBloc(LoginState(false,"","",""));
    _baseClass=BaseClass();
    _usernameController=TextEditingController();
    _passordcontroller=TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(appBar: AppBar(title: Text('Login Form'),),
     // bloclistener invoke in response to state changes in the bloc
     body:BlocListener<LoginBloc,LoginState>(
       bloc: _loginBloc,
       listener: (context,state)
       {
         if(!state.isLoginSuccess)
           {
             _baseClass.showAlertDialog(context, state.response);
           }

       },
       //BlocBuilder handles building the widget in response to new states.
       child: BlocBuilder<LoginBloc,LoginState>(
         bloc: _loginBloc,
         builder: (context, state)
         {
           return LoginForm(state);
         },
       ) ,
      )
     );
  }

  Widget LoginForm(LoginState state)
  {
   return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
        child: Column(children: [
          Center(
              child: Text("Login Form",
                style: TextStyle(fontSize: 20, color: Colors.blue),)
          ),

          Padding(padding: EdgeInsets.only(top: 40,), child:
          TextField(
            controller: _usernameController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: "User name",
                prefixIcon: Icon(Icons.email),
                errorText: state.usermsg,
                border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.green)),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.blue)),
                ),
          ),
          ),


          Padding(padding: EdgeInsets.only(top: 20,), child:
          TextField(
            controller: _passordcontroller,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
                errorText: state.passwordmsg,
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.green)),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.blue)),
                ),
          )
          ),



          Padding(padding:EdgeInsets.only(top: 20),
          child:ElevatedButton(
              onPressed: (){
                _loginBloc.add(LoginEvent(_usernameController.text,_passordcontroller.text));
              },
            child: Text("Login",style: TextStyle(color: Colors.white,),

          )

          )
          )

        ],),
      )
      );


  }

}