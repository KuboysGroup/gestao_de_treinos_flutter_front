import 'package:gestao_de_treinos_flutter_front/config/auth/usuario/states/usuario_state.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogoutModal extends HookConsumerWidget {
  const LogoutModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuario = ref.watch(usuarioStateProvider);
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sair', style: TextStyle(fontSize: 24.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Tem certeza que deseja sair?',
                  style: TextStyle(
                      fontSize: 14.0, color: Color.fromARGB(255, 87, 87, 87)),
                ),
                const SizedBox(height: 32.0),
                usuario.when(
                  data: (usuario) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      tileColor: Colors.grey.withValues(alpha: 0.15),
                      title: Text(usuario!.nome),
                      subtitle: Text('Email - ${usuario.email}'),
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: const Icon(
                          FluentIcons.person_24_filled,
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) =>
                      const Text('Erro ao carregar o usuário'),
                  loading: () => const CircularProgressIndicator(
                    color: Color.fromARGB(255, 59, 59, 59),
                    strokeCap: StrokeCap.square,
                    strokeWidth: 1.0,
                  ),
                ),
              ],
            ),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Button(
            onTap: () async {
              await ref.read(usuarioStateProvider.notifier).attemptLogout();
            },
            type: ButtonType.filled,
            color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.35),
            title: 'Sair',
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
