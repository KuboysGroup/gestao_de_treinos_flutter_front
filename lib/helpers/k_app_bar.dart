import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

/// Remove the default Material AppBar leading.
const bool automaticallyImplyLeading = false;

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// A widget to display main [KAppBar] action.
  final Widget? leading;

  /// A list of widgets to display secundarily [KAppBar] actions.
  final List<Widget>? actions;

  /// The preferredSize height for [KAppBar].
  final double height;

  final Widget? centerWidget;

  /// Constructor for [KAppBar].
  ///
  /// [leading] is optional and can be null.
  /// [actions] are optional and can be null.
  /// [height] is optional and can not be null (a default value is previously set).
  const KAppBar({
    super.key,
    this.leading,
    this.actions,
    this.height = kToolbarHeight,
    this.centerWidget,
  });

  @override
  Size get preferredSize => const Size.fromHeight(74.0);

  @override
  Widget build(BuildContext context) {
    void popScreen() => Navigator.of(context).pop();

    return SafeArea(
      child: AppBar(
        forceMaterialTransparency: true,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: centerWidget != null,
        title: centerWidget,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // leading
                leading ??
                    IconButton(
                      onPressed: popScreen,
                      icon: const Icon(FluentIcons.arrow_left_24_regular),
                    ),
                // actions
                if (actions != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...actions!.map((action) => action),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
