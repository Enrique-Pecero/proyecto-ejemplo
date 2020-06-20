import 'package:flutter/material.dart';
import 'package:labsol/src/repository/user_repository.dart';
import 'package:labsol/src/ui/register/register_screen.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
    :assert(userRepository!= null),
    _userRepository = userRepository,
    super(key: key);


  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text('Create an Account'),
      shape: StadiumBorder(),
      highlightColor: Colors.blue[100],
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return RegisterScreen(userRepository: _userRepository,);
          })
        );
      },
    );
  }
}