import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labsol/src/bloc/register_bloc/bloc.dart';
import 'package:labsol/src/bloc/authentication_bloc/bloc.dart';
import 'package:labsol/src/ui/register/register_button.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Dos variables
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _nombreController.text.isNotEmpty && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  
  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();

    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _nombreController.addListener(_onEmailChanged);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        // Si estado es submitting
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Registering'),
                    CircularProgressIndicator()
                  ],
                ),
              )
            );
        }
        // Si estado es success
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context)
            .add(LoggedIn());
          Navigator.of(context).pop();
        }
        // Si estado es failure
        if (state.isFailure) {
          Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Registration Failure'),
                  Icon(Icons.error)
                ],
              ),
              backgroundColor: Colors.red,
            )
          );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(
                      'assets/edificio_photon_2.png',
                     // height: 250,
                    ),
                  ),

                  // Un textForm para email
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      autovalidate: true,
                      validator: (_){
                        return !state.isEmailValid? 'Invalid Email' : null;
                      },
                    ),
                  ),
                  // Un textForm para password
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Password'
                      ),
                      obscureText: true,
                      autocorrect: false,
                      autovalidate: true,
                      validator: (_){
                        return !state.isPasswordValid ? 'Invalid Password': null;
                      },
                    ),
                  ),

                  // Un button
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: RegisterButton(
                      onPressed: isRegisterButtonEnabled(state)
                        ? _onFormSubmitted
                        : null,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }

  void _onEmailChanged() {
    _registerBloc.add(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordChanged() {
    _registerBloc.add(
      PasswordChanged(password: _passwordController.text)
    );
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text
      )
    );
  }
}
