import 'package:flutter/material.dart';

import 'package:tikweb_task/core/utils/debouncer.dart';

class HomeSearchbar extends StatefulWidget {
  final ValueChanged<String> onSearch;
  const HomeSearchbar({super.key, required this.onSearch});
  @override
  State<HomeSearchbar> createState() => _HomeSearchbarState();
}

class _HomeSearchbarState extends State<HomeSearchbar> {
  final TextEditingController _controller = TextEditingController();
  final Debouncer _debouncer = Debouncer(delay: Duration(seconds: 1));
  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    _debouncer.run(() {
      widget.onSearch(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
