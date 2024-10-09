// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';

final adapter = SolanaWalletAdapter(
  const AppIdentity(),
  // NOTE: CONNECT THE WALLET APPLICATION
  //       TO THE SAME NETWORK.
  cluster: Cluster.devnet,
);

class AuthorizeButton extends StatefulWidget {
  const AuthorizeButton({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<AuthorizeButton> createState() => _AuthorizeButtonState();
}

class _AuthorizeButtonState extends State<AuthorizeButton> {
  Object? _output;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            // 2. Authorize application with wallet.
            adapter
                .authorize()
                .then((result) => setState(() => _output = result.toJson()))
                .catchError((error) => setState(() => _output = error));
          },
          child: const Text('Authorize'),
        ),
        if (_output != null) Text(_output.toString()),
      ],
    );
  }
}
