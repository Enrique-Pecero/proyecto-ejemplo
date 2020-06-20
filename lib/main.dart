import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:labsol/src/bloc/authentication_bloc/bloc.dart';
import 'package:labsol/src/bloc/simple_bloc_delegate.dart';
import 'package:labsol/src/repository/user_repository.dart';
import 'package:labsol/src/ui/home_screen.dart';
import 'package:labsol/src/ui/login/login_screen.dart';
import 'package:labsol/src/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          // * Al entrar a la app, este o no este logueado se mostrara el splash
          if (state is Uninitialized) {
            return SplashScreen();
          }
          // * si esta logueado(autenticado) mandara al menu principal, homePage
          if (state is Authenticated) {
            return HomePage(
              name: state.displayName,
            );
          }
          // * Si aun no se ha registrado o autenticado mostrara el login
          if (state is Unauthenticated) {
            return LoginScreen(
              userRepository: _userRepository,
            );
          }
          return Container();
        },
      ),
    );
  }
}
