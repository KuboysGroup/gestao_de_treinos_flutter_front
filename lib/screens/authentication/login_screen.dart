import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/screens/authentication/components/cadastrar_screen.dart';
import 'package:gestao_de_treinos_flutter_front/screens/authentication/components/login_components.dart';
import 'package:gestao_de_treinos_flutter_front/screens/authentication/controllers/login_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numBdController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final loginController = LoginController();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 500.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: AppIntroduction(),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: UsernameTextFormField(
                                  usernameController: usernameController),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: PasswordTextFormField(
                                  passwordController: passwordController),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: LoginButton(
                              numBdController: numBdController,
                              usernameController: usernameController,
                              passwordController: passwordController,
                              attemptLogin: () => loginController.attemptLogin(
                                  context,
                                  ref,
                                  _formKey,
                                  usernameController,
                                  passwordController),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Button(
                                  title: 'Não possui conta? Cadastrar',
                                  onTap: () {
                                    KModal.show(
                                      direction: ModalDirection.right,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      body: Scaffold(
                                        appBar: PreferredSize(
                                          preferredSize:
                                              const Size.fromHeight(100.0),
                                          child: KModalNavigation(
                                            icon: FluentIcons
                                                .arrow_left_24_regular,
                                            onTap: () => context.pop(),
                                          ),
                                        ),
                                        body: CadastrarScreen(),
                                      ),
                                      context: context,
                                    );
                                  },
                                  type: ButtonType.outlined,
                                  color: Colors.orangeAccent))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  // ignore: library_private_types_in_public_api
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      decoration: InputDecoration(
        hintText: "Senha",
        hintStyle: const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility : Icons.visibility_off,
            color: Colors.black38,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
      validator: (String? value) {
        if (const String.fromEnvironment('ENVIROMENT') == 'production' &&
            (value == null || value.isEmpty)) {
          return 'Digite a senha do usuário';
        }
        return null;
      },
      obscureText: _isObscured,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}

class LoginButton extends StatelessWidget {
  final TextEditingController numBdController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const LoginButton({
    super.key,
    required this.numBdController,
    required this.attemptLogin,
    required this.usernameController,
    required this.passwordController,
  });

  final Future<void> Function() attemptLogin;

  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: attemptLogin,
      type: ButtonType.filled,
      color: Colors.orangeAccent,
      icon: const Icon(
        FluentIcons.arrow_right_24_regular,
        color: Colors.white,
      ),
      title: 'Entrar',
      // height: 64.0,
    );
  }
}
