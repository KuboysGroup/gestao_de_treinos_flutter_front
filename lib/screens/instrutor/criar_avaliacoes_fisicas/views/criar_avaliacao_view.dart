// ignore_for_file: use_build_context_synchronously

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/kg_input_formatter.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/requests/avaliacoes_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/states/usuario_selecionado_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/views/selecionar_aluno_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

class CriarAvaliacaoView extends HookConsumerWidget {
  final Usuario usuario;
  const CriarAvaliacaoView({super.key, required this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioSelecionado = ref.watch(usuarioSelecionadoStateProvider);
    final pesoController = useTextEditingController();
    final alturaController = useTextEditingController();
    final percentualGorduraController = useTextEditingController();
    final massaMuscularController = useTextEditingController();

    Future<void> criarAvaliacao() async {
      final input = DateFormat('yyyy-MM-dd');

      Usuario aluno = Usuario(id: usuarioSelecionado!.id);
      Usuario instrutor = Usuario(id: usuario.id);

      Map<String, dynamic> bodyrequest = {
        'id': null,
        'idInstrutor': instrutor.id,
        'nomeInstrutor': instrutor.nome,
        'idAluno': aluno.id,
        'nomeAluno': aluno.nome,
        'peso': double.parse(pesoController.text),
        'altura': double.parse(alturaController.text),
        'percentualGordura': double.parse(percentualGorduraController.text),
        'massaMuscularKg': double.parse(massaMuscularController.text),
        'data': input.format(DateTime.now())
      };
      // bodyrequest['id'] = null;

      // AvaliacaoFisica avaliacaoFisica = AvaliacaoFisica(
      //     id: null,
      //     instrutor: instrutor,
      //     aluno: aluno,
      //     peso: double.parse(pesoController.text),
      //     altura: double.parse(alturaController.text),
      //     percentualGordura: double.parse(percentualGorduraController.text),
      //     massaMuscularKg: double.parse(massaMuscularController.text),
      //     data: input.format(DateTime.now()));

      try {
        final response =
            await AvaliacoesRequests.registrarAvaliacao(bodyrequest);
        if (response != 200) {
          showTostification(context, ToastificationType.error, 'Ops :(',
              'Erro ao cadastrar avaliação física');
        } else {
          context.pop();
          showTostification(context, ToastificationType.success,
              'Avaliação física cadastrado!', '');
        }
      } catch (e) {
        showTostification(context, ToastificationType.error, 'Ops :(',
            'Erro ao cadastrar avaliação física');
      }
    }

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
                Text('Criar avaliação física',
                    style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Selecione um aluno para fazer a avaliação física',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 36.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Aluno'),
                        const SizedBox(height: 12.0),
                        GestureDetector(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.withValues(alpha: 0.15),
                              hintText: 'Aluno',
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            child: Text(usuarioSelecionado == null
                                ? 'Selecione o aluno'
                                : usuarioSelecionado.nome),
                          ),
                          onTap: () {
                            KModal.show(
                              direction: ModalDirection.right,
                              width: 500,
                              body: Scaffold(
                                appBar: PreferredSize(
                                  preferredSize: const Size.fromHeight(110.0),
                                  child: KModalNavigation(
                                    icon: FluentIcons.arrow_left_24_regular,
                                    onTap: () => context.pop(),
                                  ),
                                ),
                                body: const SelecionarAlunoView(),
                              ),
                              context: context,
                            );
                          },
                        ),
                      ],
                    ),
                    TextFormField(
                      enabled: true,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: pesoController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        KGInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Peso',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    TextFormField(
                      enabled: true,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: alturaController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        KGInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Altura',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    TextFormField(
                      enabled: true,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: percentualGorduraController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        KGInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Percentual de gordura',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    TextFormField(
                      enabled: true,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: massaMuscularController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        KGInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Massa muscular',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(),
                    Button(
                      onTap: () {
                        criarAvaliacao();
                      },
                      type: ButtonType.filled,
                      color: Colors.orangeAccent,
                      title: 'Concluir',
                    )
                  ],
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
