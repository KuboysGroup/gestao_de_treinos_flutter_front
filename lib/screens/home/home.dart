import 'package:gestao_de_treinos_flutter_front/config/auth/usuario/states/usuario_state.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/home/controllers/controllers.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuario = ref.watch(usuarioStateProvider);

    void goToTransferencia(BuildContext context, Usuario user) {
      context.go('/treinos', extra: user);
    }

    void goToAvaliacoes(BuildContext context, Usuario user) {
      context.go('/avaliacoes_fisicas', extra: user);
    }

    void goToCriarExercicios(BuildContext context) {
      context.go('/criar_exercicios');
    }

    void goToCriarAvaliacoes(BuildContext context, Usuario user) {
      context.go('/criar_avaliacoes', extra: user);
    }

    void goToCriarTreinos(BuildContext context, Usuario user) {
      context.go('/criar_treinos', extra: user);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
                    backgroundColor: WidgetStatePropertyAll(
                        Colors.grey.withValues(alpha: 0.15))),
                onPressed: () {
                  abrirModal(context);
                },
                icon: Icon(Icons.logout_rounded)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/treinos.jpg',
                        isAntiAlias: true,
                        centerSlice: Rect.fromLTRB(0.5, 0.5, 0.5, 0.5),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Gestão de treinos',
                        style: TextStyle(fontSize: 50),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      usuario.when(
                        data: (usuario) {
                          return Center(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Usuário - ${usuario!.nome}'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Email - ${usuario.email}'),
                                      Text('Perfil - ${usuario.perfil}')
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 6.0),
                                  leading: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    child: const Icon(
                                      FluentIcons.person_24_filled,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                if (usuario.perfil == 'ALUNO')
                                  Column(
                                    children: [
                                      ListTile(
                                        onTap: () =>
                                            goToTransferencia(context, usuario),
                                        title: const Text('Treinos'),
                                        subtitle: const Text(
                                            'Criar treinos personalizados'),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 32.0,
                                                vertical: 6.0),
                                        leading: Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: Colors.orangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: const Icon(
                                            Icons.sports_gymnastics,
                                            color: Colors.white,
                                          ),
                                        ),
                                        trailing: const Icon(FluentIcons
                                            .chevron_right_24_regular),
                                      ),
                                      ListTile(
                                        onTap: () =>
                                            goToAvaliacoes(context, usuario),
                                        title: const Text('Avaliações físicas'),
                                        subtitle: const Text(
                                            'Veja suas últimas avaliações físicas realizadas pelo instrutor'),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 32.0,
                                                vertical: 6.0),
                                        leading: Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: Colors.orangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: const Icon(
                                            Icons.sports_gymnastics,
                                            color: Colors.white,
                                          ),
                                        ),
                                        trailing: const Icon(
                                            FluentIcons.document_24_regular),
                                      )
                                    ],
                                  ),
                                if (usuario.perfil == 'INSTRUTOR')
                                  Column(
                                    children: [
                                      ListTile(
                                        onTap: () =>
                                            goToCriarExercicios(context),
                                        title: const Text('Exercícios'),
                                        subtitle: const Text(
                                            'Gerencie os exercícios'),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 32.0,
                                                vertical: 6.0),
                                        leading: Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: Colors.orangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: const Icon(
                                            Icons.sports_gymnastics,
                                            color: Colors.white,
                                          ),
                                        ),
                                        trailing: const Icon(FluentIcons
                                            .chevron_right_24_regular),
                                      ),
                                      ListTile(
                                        onTap: () => goToCriarAvaliacoes(
                                            context, usuario),
                                        title: const Text('Avaliações físicas'),
                                        subtitle: const Text(
                                            'Gerencie as avaliações físicas dos seus alunos'),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 32.0,
                                                vertical: 6.0),
                                        leading: Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: Colors.orangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: const Icon(
                                            Icons.monitor_weight,
                                            color: Colors.white,
                                          ),
                                        ),
                                        trailing: const Icon(FluentIcons
                                            .chevron_right_24_regular),
                                      ),
                                      ListTile(
                                        onTap: () =>
                                            goToCriarTreinos(context, usuario),
                                        title: const Text('Treinos'),
                                        subtitle: const Text(
                                            'Crie treinos personalizados para seus alunos'),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 32.0,
                                                vertical: 6.0),
                                        leading: Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: Colors.orangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: const Icon(
                                            FluentIcons.document_24_regular,
                                            color: Colors.white,
                                          ),
                                        ),
                                        trailing: const Icon(FluentIcons
                                            .chevron_right_24_regular),
                                      ),
                                    ],
                                  )
                              ],
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
