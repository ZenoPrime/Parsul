// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/// Imports
/// ------------------------------------------------------------------------------------------------

import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'package:solana_web3/programs.dart';
import 'package:solana_web3/solana_web3.dart' as SolanaWeb3;

/// Transfer Data
/// ------------------------------------------------------------------------------------------------

class TransferData {
  const TransferData({
    required this.transaction,
    required this.receiver,
    required this.lamports,
  });
  final SolanaWeb3.Transaction transaction;
  final SolanaWeb3.Keypair receiver;
  final BigInt lamports;
}

/// Example App
/// ------------------------------------------------------------------------------------------------

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

/// Example App State
/// ------------------------------------------------------------------------------------------------

class _ExampleAppState extends State<ExampleApp> {
  /// Initialization future.
  late final Future<void> _future;

  /// NOTE: Your wallet application must be connected to the same cluster.
  static final Cluster cluster = Cluster.devnet;

  /// Request status.
  String? _status;

  /// Create an instance of the [SolanaWalletAdapter].
  final SolanaWalletAdapter adapter = SolanaWalletAdapter(
    AppIdentity(
        // uri: Uri.https('merigo.com'),   // YOUR_APP_DOMAIN.
        // icon: Uri.parse('favicon.png'), // YOUR_ICON_PATH relative to `uri`
        // name: 'Example App',            // YOUR_APP_NAME.
        ),
    cluster: cluster, // The cluster your wallet is connected to.
    hostAuthority: null, // The server address that brokers a remote connection.
  );

  /// Load the adapter's stored state.
  @override
  void initState() {
    super.initState();
    _future = SolanaWalletAdapter.initialize();
  }

  /// Requests an airdrop of 2 SOL for [wallet].
  Future<void> _airdrop(final SolanaWeb3.Connection connection,
      final SolanaWeb3.Pubkey wallet) async {
    if (cluster != Cluster.mainnet) {
      setState(() => _status = "Requesting airdrop...");
      await connection.requestAndConfirmAirdrop(
          wallet, SolanaWeb3.solToLamports(2).toInt());
    }
  }

  /// Creates [count] number of SOL transfer transactions.
  Future<List<TransferData>> _createTransfers(
    final SolanaWeb3.Connection connection, {
    required final int count,
  }) async {
    // Check connected wallet.
    setState(() => _status = "Pending...");
    final SolanaWeb3.Pubkey? wallet =
        SolanaWeb3.Pubkey.tryFromBase64(adapter.connectedAccount?.address);
    if (wallet == null) {
      throw 'Wallet not connected';
    }

    // Amount being transfered.
    final BigInt lamports = SolanaWeb3.solToLamports(0.001);

    // Airdrop some SOL to the wallet account if required.
    setState(() => _status = "Checking balance...");
    final int balance = await connection.getBalance(wallet);
    if (balance < (1000000 + lamports.toInt())) _airdrop(connection, wallet);

    // Create a SystemProgram instruction to transfer some SOL.
    setState(() => _status = "Creating transaction...");
    final latestBlockhash = await connection.getLatestBlockhash();
    final List<TransferData> txs = [];
    for (int i = 0; i < count; ++i) {
      final SolanaWeb3.Keypair receiver = SolanaWeb3.Keypair.generateSync();
      final SolanaWeb3.Transaction transaction = SolanaWeb3.Transaction.v0(
          payer: wallet,
          recentBlockhash: latestBlockhash.blockhash,
          instructions: [
            SystemProgram.transfer(
              fromPubkey: wallet,
              toPubkey: receiver.pubkey,
              lamports: lamports,
            )
          ]);
      txs.add(TransferData(
        transaction: transaction,
        receiver: receiver,
        lamports: lamports,
      ));
    }
    return txs;
  }

  /// Creates [count] number of large transactions.
  Future<List<SolanaWeb3.Transaction>> _createLargeTransactions(
    final SolanaWeb3.Connection connection, {
    required final int count,
  }) async {
    setState(() => _status = "Pending...");
    final SolanaWeb3.Pubkey? wallet =
        SolanaWeb3.Pubkey.tryFromBase64(adapter.connectedAccount?.address);
    if (wallet == null) {
      throw 'Wallet not connected';
    }

    // Create a SystemProgram instruction to transfer some SOL.
    setState(() => _status = "Creating large transaction...");
    final latestBlockhash = await connection.getLatestBlockhash();
    final List<SolanaWeb3.Transaction> txs = [];
    for (int i = 0; i < count; ++i) {
      final SolanaWeb3.Transaction transaction = SolanaWeb3.Transaction.v0(
          payer: wallet,
          recentBlockhash: latestBlockhash.blockhash,
          instructions: [
            for (int j = 0; j < 2; ++j)
              MemoProgram.create(
                  "Abstract. A purely peer-to-peer version of electronic cash would allow online"
                  "payments to be sent directly from one party to another without going through a"
                  "financial institution. Digital signatures provide part of the solution, but the main"
                  "benefits are lost if a trusted third party is still required to prevent double-spending."
                  "We propose a solution to the double-spending problem using a peer-to-peer network."
                  "The network timestamps transactions by hashing them into an ongoing chain of"
                  "hash-based proof-of-work, forming a record that cannot be changed without redoing"),
          ]);
      txs.add(transaction);
    }
    return txs;
  }

  /// Checks the results of [transfers].
  Future<void> _confirmTransfers(
    final SolanaWeb3.Connection connection, {
    required final List<String?> signatures,
    required final List<TransferData> transfers,
  }) async {
    // Wait for confirmations (**You need to convert the base-64 signatures to base-58!**).
    setState(() => _status = "Confirming transaction signature...");
    await Future.wait(
      [
        for (final sig in signatures)
          connection.confirmTransaction(SolanaWeb3.base58To64Decode(sig!))
      ],
      eagerError: true,
    );

    // Get the receiver balances.
    setState(() => _status = "Checking balance...");
    final List<int> receiverBalances = await Future.wait(
      [
        for (final transfer in transfers)
          connection.getBalance(transfer.receiver.pubkey)
      ],
      eagerError: true,
    );

    // Check the updated balances.
    final List<String> results = [];
    for (int i = 0; i < receiverBalances.length; ++i) {
      final TransferData transfer = transfers[i];
      final SolanaWeb3.Pubkey pubkey = transfer.receiver.pubkey;
      final BigInt balance = receiverBalances[i].toBigInt();
      if (balance != transfer.lamports)
        throw Exception('Post transaction balance mismatch.');
      results.add("Transfer: Address $pubkey received $balance SOL");
    }

    // Output the result.
    setState(() => _status = "Success!\n\n"
        "Signatures: $signatures\n\n"
        "${results.join('\n')}"
        "\n");
  }

  /// Signs and send [count] number of transactions to the network (then confirms the transaction
  /// results).
  void _signAndSendTransactions(final int count) async {
    final String description = "Sign And Send Transactions ($count)";
    try {
      setState(() => _status = "Create $description...");
      final SolanaWeb3.Connection connection = SolanaWeb3.Connection(cluster);
      final List<TransferData> transfers =
          await _createTransfers(connection, count: count);

      setState(() => _status = "$description...");
      final SignAndSendTransactionsResult result =
          await adapter.signAndSendTransactions(
        transfers
            .map((transfer) => adapter.encodeTransaction(transfer.transaction))
            .toList(),
      );

      setState(() => _status = "Confirm $description...");
      await _confirmTransfers(
        connection,
        signatures: result.signatures,
        transfers: transfers,
      );
    } catch (error, stack) {
      print('$description Error: $error');
      print('$description Stack: $stack');
      setState(() => _status = error.toString());
    }
  }

  Widget _builder(final BuildContext context, final AsyncSnapshot snapshot) {
    if (snapshot.connectionState != ConnectionState.done) {
      return const CircularProgressIndicator();
    }
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        onPressed:
            adapter.isAuthorized ? () => _signAndSendTransactions(1) : null,
        child: const Text('Sign and Send Transactions (1)'),
      ),
      Text(_status ?? ''),
    ]);
  }

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: _future,
        builder: _builder,
      ),
    );
  }
}
