import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/models/avaliacao_fisica.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/states/avaliacoes_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/views/criar_avaliacao_view.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/views/editar_avaliacao.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class CriarAvaliacoes extends HookConsumerWidget {
  final Usuario usuario;
  const CriarAvaliacoes({super.key, required this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avaliacoes = ref.watch(avaliacoesStateProvider(usuario.id!));
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Avaliações físicas',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Gerencie as avaliações físicas dos seus alunos',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  avaliacoes.when(
                      data: (avaliacoesList) {
                        final agrupado =
                            _agruparAvaliacoesPorAluno(avaliacoesList);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Button(
                                    onTap: () {
                                      KModal.show(
                                        direction: ModalDirection.right,
                                        width: 500,
                                        body: Scaffold(
                                          appBar: PreferredSize(
                                            preferredSize:
                                                const Size.fromHeight(110.0),
                                            child: KModalNavigation(
                                              icon: FluentIcons
                                                  .arrow_left_24_regular,
                                              onTap: () => context.pop(),
                                            ),
                                          ),
                                          body: CriarAvaliacaoView(
                                              usuario: usuario),
                                        ),
                                        context: context,
                                      );
                                    },
                                    type: ButtonType.outlined,
                                    color: Colors.orangeAccent,
                                    title: 'Incluir avaliação',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Theme(
                                data: Theme.of(context).copyWith(
                                  cardTheme: const CardTheme(
                                      elevation: 0, color: Colors.white),
                                ),
                                child: ScrollConfiguration(
                                  behavior:
                                      ScrollConfiguration.of(context).copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.touch,
                                      PointerDeviceKind.mouse,
                                    },
                                  ),
                                  child: SingleChildScrollView(
                                    child: Scrollbar(
                                      controller: scrollController,
                                      interactive: true,
                                      thumbVisibility: true,
                                      child: PaginatedDataTable(
                                        showCheckboxColumn: false,
                                        headingRowColor:
                                            WidgetStateProperty.all<Color>(
                                          Colors.grey.withValues(alpha: 0.15),
                                        ),
                                        horizontalMargin: 32.0,
                                        rowsPerPage: avaliacoesList.length >= 10
                                            ? 10
                                            : avaliacoesList.length,
                                        columns: pedidosColumns(),
                                        source: PedidosRows(
                                            avaliacoesList, context, ref),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 60),
                              Wrap(
                                spacing: 5,
                                runSpacing: 20,
                                children: agrupado.entries.map((entry) {
                                  final nomeAluno = entry.key;
                                  final avaliacoes = entry.value;

                                  return SizedBox(
                                    width: 600, // ou ajuste conforme necessário
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Progressão: $nomeAluno',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: DataTable(
                                                columnSpacing: 12,
                                                columns: const [
                                                  DataColumn(
                                                      label: Text('Data')),
                                                  DataColumn(
                                                      label: Text('Peso')),
                                                  DataColumn(
                                                      label: Text('IMC')),
                                                  DataColumn(
                                                      label:
                                                          Text('Gordura (%)')),
                                                  DataColumn(
                                                      label: Text(
                                                          'Massa Muscular')),
                                                  DataColumn(
                                                      label: Text('Status')),
                                                ],
                                                rows: avaliacoes.map((a) {
                                                  final data =
                                                      DateFormat('yyyy-MM-dd')
                                                          .parse(a.data);
                                                  final primeira =
                                                      avaliacoes.first;
                                                  final status =
                                                      _avaliarProgresso(
                                                          primeira, a);

                                                  return DataRow(
                                                    color: MaterialStateProperty
                                                        .all<Color>(
                                                      status == 'Progresso'
                                                          ? Colors
                                                              .green.shade100
                                                          : status == 'Piora'
                                                              ? Colors
                                                                  .red.shade100
                                                              : Colors.grey
                                                                  .shade200,
                                                    ),
                                                    cells: [
                                                      DataCell(Text(DateFormat(
                                                              'dd/MM/yyyy')
                                                          .format(data))),
                                                      DataCell(Text(
                                                          '${a.peso.toStringAsFixed(2)} Kg')),
                                                      DataCell(Text(a.imc
                                                          .toStringAsFixed(2))),
                                                      DataCell(Text(
                                                          '${a.percentualGordura.toStringAsFixed(2)} %')),
                                                      DataCell(Text(
                                                          '${a.massaMuscularKg.toStringAsFixed(2)} Kg')),
                                                      DataCell(Text(status)),
                                                    ],
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                      error: (error, stacktrace) =>
                          ErrorData(error: Text('$error')),
                      loading: () => const Center(child: LoadingData()))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

String _avaliarProgresso(AvaliacaoFisica primeira, AvaliacaoFisica atual) {
  final deltaIMC = atual.imc - primeira.imc;
  final deltaGordura = atual.percentualGordura - primeira.percentualGordura;
  final deltaMusculo = atual.massaMuscularKg - primeira.massaMuscularKg;

  // Lógica baseada no IMC e gordura corporal
  if (deltaIMC.abs() < 0.5 &&
      deltaGordura.abs() < 1 &&
      deltaMusculo.abs() < 1) {
    return 'Estável';
  }

  if (deltaGordura < -1 || deltaIMC < -1 || deltaMusculo > 1) {
    return 'Progresso';
  }

  if (deltaGordura > 1 || deltaIMC > 1 || deltaMusculo < -1) {
    return 'Piora';
  }

  return 'Estável';
}

Map<String, List<AvaliacaoFisica>> _agruparAvaliacoesPorAluno(
    List<AvaliacaoFisica> avaliacoes) {
  final Map<String, List<AvaliacaoFisica>> agrupado = {};
  for (var a in avaliacoes) {
    agrupado.putIfAbsent(a.nomeAluno, () => []).add(a);
  }

  for (var lista in agrupado.values) {
    lista.sort((a, b) => a.data.compareTo(b.data));
  }

  return agrupado;
}

List<DataColumn> pedidosColumns() {
  return [
    const DataColumn(
        label: Text(
      'Data',
    )),
    const DataColumn(
        label: Text(
      'Aluno',
    )),
    const DataColumn(
        numeric: true,
        label: Text(
          'Peso',
        )),
    const DataColumn(
        numeric: true,
        label: Text(
          'Alura',
        )),
    const DataColumn(
        numeric: true,
        label: Text(
          'IMC',
        )),
    const DataColumn(
        numeric: true,
        label: Text(
          'Percentual gordura',
        )),
    const DataColumn(
        numeric: true,
        label: Text(
          'Massa muscular',
        )),
    const DataColumn(
        label: Text(
      'Ações',
    )),
  ];
}

class PedidosRows extends DataTableSource {
  final List<AvaliacaoFisica> avaliacaoData;
  final BuildContext context;
  final WidgetRef ref;

  PedidosRows(this.avaliacaoData, this.context, this.ref);

  @override
  int get rowCount => avaliacaoData.length;

  @override
  DataRow? getRow(int index) {
    if (index >= avaliacaoData.length) {
      return null;
    }

    final AvaliacaoFisica avaliacaoFisica = avaliacaoData[index];
    final output = DateFormat('dd/MM/yyyy');
    final input = DateFormat('yyyy-MM-dd');
    DateTime parsedDate = input.parse(avaliacaoFisica.data);

    // Define a cor alternada
    final rowColor = index % 2 == 0 ? Colors.white : Colors.grey.shade100;

    return DataRow(
      color: WidgetStateProperty.all(rowColor),
      selected: false,
      cells: [
        DataCell(Text(output.format(parsedDate))),
        DataCell(Text(avaliacaoFisica.nomeAluno)),
        DataCell(Text('${avaliacaoFisica.peso.toStringAsFixed(2)} Kg')),
        DataCell(Text(avaliacaoFisica.altura.toStringAsFixed(2))),
        DataCell(Text(avaliacaoFisica.imc.toStringAsFixed(2))),
        DataCell(
            Text('${avaliacaoFisica.percentualGordura.toStringAsFixed(2)} %')),
        DataCell(
            Text('${avaliacaoFisica.massaMuscularKg.toStringAsFixed(2)} Kg')),
        DataCell(Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 12),
          child: Button(
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
                  body: EditarAvaliacao(avaliacaoFisica: avaliacaoFisica),
                ),
                context: context,
              );
            },
            type: ButtonType.filled,
            color: Colors.orangeAccent,
            title: 'Editar',
          ),
        ))
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
