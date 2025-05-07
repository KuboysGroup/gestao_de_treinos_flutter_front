import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/states/usuario_selecionado_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/states/usuarios_state.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class SelecionarAlunoView extends HookConsumerWidget {
  const SelecionarAlunoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarios = ref.watch(usuariosStateProvider);
    ref.watch(usuarioSelecionadoStateProvider);
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Aluno', style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Selecione o aluno para fazer a avaliação física',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 36.0),
                ...usuarios.when(
                    data: (usuarios) => {
                          ...usuarios
                              .where((usuario) => usuario.perfil == 'ALUNO')
                              .map((usuario) {
                            final output = DateFormat('dd/MM/yyyy');
                            final input = DateFormat('yyyy-MM-dd');
                            DateTime parsedDate =
                                input.parse(usuario.dataNascimento);
                            return ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              leading: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: const Icon(
                                  FluentIcons.person_24_filled,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(usuario.nome),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(usuario.email,
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Data de nascimento',
                                          style: TextStyle(fontSize: 12)),
                                      Text(output.format(parsedDate),
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  )
                                ],
                              ),
                              onTap: () {
                                ref
                                    .read(usuarioSelecionadoStateProvider
                                        .notifier)
                                    .selecionarUsuario(usuario);
                                context.pop();
                              },
                            );
                          })
                        },
                    error: (error, stacktrace) => {
                          ErrorData(
                            error: Text('$error'),
                          )
                        },
                    loading: () => {const Center(child: LoadingData())})
              ],
            ),
          ),
        ))
      ],
    );
  }
}
