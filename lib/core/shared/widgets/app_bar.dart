import 'package:flutter/material.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/theming/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.titleWDG,
    this.bottom,
  });

  final Widget? leading, titleWDG;
  final String? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.primaryColor,
      title: titleWDG ??
          (title == null
              ? null
              : Text(
                  title!,
                  style: AppTextStyles.font18SemiBold.copyWith(
                    color: context.theme.scaffoldBackgroundColor,
                  ),
                )),
      centerTitle: true,
      leading: leading,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  Widget get child => throw UnimplementedError();
}
