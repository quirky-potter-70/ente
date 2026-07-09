import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher_string.dart";

class WebPage extends StatefulWidget {
  final String title;
  final String url;

  // if true, show open in browser icon in appBar
  final bool canOpenInBrowser;

  const WebPage(
    this.title,
    this.url, {
    super.key,
    this.canOpenInBrowser = false,
  });

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await launchUrlString(widget.url, mode: LaunchMode.externalApplication);
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.shrink(),
    );
  }
}
