import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(this.colorScheme, {this.circular = false, super.key});

  final ColorScheme colorScheme;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    return circular
        ? SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CircularProgressIndicator(color: colorScheme.secondary),
              ),
            ),
          )
        : SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: LinearProgressIndicator(color: colorScheme.secondary),
              ),
            ),
          );
  }
}
