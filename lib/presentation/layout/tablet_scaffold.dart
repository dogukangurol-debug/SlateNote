import 'package:flutter/material.dart';

import '../../core/constants/app_breakpoints.dart';
import '../widgets/app_topbar.dart';
import '../widgets/responsive_split_view.dart';
import 'sidebar.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({
    super.key,
    required this.title,
    required this.child,
    this.toolsPanel,
  });

  final String title;
  final Widget child;
  final Widget? toolsPanel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= AppBreakpoints.tabletWide;
        return Scaffold(
          endDrawer: isWide ? null : _ToolsPanel(content: toolsPanel),
          body: SafeArea(
            child: ResponsiveSplitView(
              left: const Sidebar(),
              center: Column(
                children: [
                  Builder(
                    builder: (context) => AppTopBar(
                      title: title,
                      showToolsButton: !isWide,
                      onOpenTools: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: child,
                    ),
                  ),
                ],
              ),
              right: _ToolsPanel(content: toolsPanel),
              showRight: isWide,
            ),
          ),
        );
      },
    );
  }
}

class _ToolsPanel extends StatelessWidget {
  const _ToolsPanel({required this.content});

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(left: BorderSide(color: Colors.grey.shade300)),
      ),
      child: content ??
          const Center(
            child: Text('Tools panel'),
          ),
    );
  }
}
