import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/screens/home/components/logout_modal.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void abrirModal(BuildContext context) {
  KModal.show(
    direction: ModalDirection.right,
    width: MediaQuery.of(context).size.width / 3,
    body: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110.0),
        child: KModalNavigation(
          icon: FluentIcons.arrow_left_24_regular,
          onTap: () => context.pop(),
        ),
      ),
      body: LogoutModal(),
    ),
    context: context,
  );
}
