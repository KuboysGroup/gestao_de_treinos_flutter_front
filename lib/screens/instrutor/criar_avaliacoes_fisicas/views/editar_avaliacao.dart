// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/avaliacao_fisica.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/requests/avaliacoes_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/states/avaliacoes_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class EditarAvaliacao extends HookConsumerWidget {
  final AvaliacaoFisica avaliacaoFisica;
  const EditarAvaliacao({super.key, required this.avaliacaoFisica});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(avaliacoesStateProvider(avaliacaoFisica.instrutor!.id!));
    Future<void> excluir() async {
      try {
        final response =
            await AvaliacoesRequests.excluirAvaliacao(avaliacaoFisica.id!);
        if (response != 200) {
          showTostification(context, ToastificationType.error, 'Ops :(',
              'Erro ao excluir avaliação');
        } else {
          ref
              .read(avaliacoesStateProvider(avaliacaoFisica.instrutor!.id!)
                  .notifier)
              .removerAvaliacao(avaliacaoFisica.id!);
          context.pop();
          showTostification(
              context, ToastificationType.success, 'Avaliação excluída!', '');
        }
      } catch (e) {
        showTostification(context, ToastificationType.error, 'Ops :(',
            'Erro ao excluir avaliação');
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
                Text(avaliacaoFisica.aluno!.nome,
                    style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Edição da avaliação',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 36.0),
                Column(
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Data'),
                        Text(
                          avaliacaoFisica.data,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Aluno'),
                        Text(avaliacaoFisica.aluno!.nome,
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Email'),
                        Flexible(
                          child: Text(avaliacaoFisica.aluno!.email,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.grey)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Altura'),
                        Text(avaliacaoFisica.altura.toString(),
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Peso'),
                        Text('${avaliacaoFisica.peso} Kg',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Percentual de gordura'),
                        Text('${avaliacaoFisica.percentualGordura} %',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Massa muscular'),
                        Text('${avaliacaoFisica.massaMuscularKg} Kg',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Button(
                            onTap: () {
                              excluir();
                            },
                            type: ButtonType.filled,
                            color: Colors.redAccent,
                            title: 'Excluir',
                          ),
                        ),
                      ],
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
