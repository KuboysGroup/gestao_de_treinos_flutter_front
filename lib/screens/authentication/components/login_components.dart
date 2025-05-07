import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:flutter/material.dart';

class AppIntroduction extends StatelessWidget {
  const AppIntroduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/images/treinos.jpg',
          // height: 60,
        ),
        Text(
          'Gestão de treinos',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Color.fromARGB(255, 26, 26, 26)),
        ),
        Text(
          "Aplicativo para os colaboradores da Capal",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}

// class Numbd extends StatelessWidget {
//   const Numbd({
//     super.key,
//     required this.numBdController,
//   });

//   final TextEditingController numBdController;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: numBdController,
//       decoration: const InputDecoration(
//         hintText: "Número do banco de dados",
//         hintStyle: TextStyle(
//           color: Colors.black38,
//           fontWeight: FontWeight.w400,
//         ),
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.black12),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.black),
//         ),
//       ),
//       keyboardType: TextInputType.number,
//       validator: (String? value) {
//         if (value == null || value.isEmpty) {
//           return 'Digite o número do banco';
//         }
//         return null;
//       },
//     );
//   }
// }

class UsernameTextFormField extends StatelessWidget {
  const UsernameTextFormField({
    super.key,
    required this.usernameController,
  });

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      decoration: const InputDecoration(
        hintText: "Email do usuário",
        hintStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      // keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Digite o código do usuário';
        }
        return null;
      },
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      decoration: const InputDecoration(
        hintText: "Senha",
        hintStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      validator: (String? value) {
        if (const String.fromEnvironment('ENVIROMENT') == 'production' &&
            (value == null || value.isEmpty)) {
          return 'Digite a senha do usuário';
        }
        return null;
      },
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.attemptLogin,
  });

  final Future<void> Function() attemptLogin;

  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: attemptLogin,
      type: ButtonType.filled,
      color: Colors.orangeAccent,
      title: 'Entrar',
      height: 64.0,
    );
  }
}
