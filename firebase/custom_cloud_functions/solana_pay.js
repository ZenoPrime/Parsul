const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.solanaPay = functions.https.onCall((data, context) => {
  // Write your code below!
  const {
    Connection,
    PublicKey,
    Transaction,
    SystemProgram,
    LAMPORTS_PER_SOL,
  } = require("@solana/web3.js");

  const MERCHANT_WALLET = new PublicKey("YOUR_SOLANA_WALLET_ADDRESS");

  exports.solanaPay = functions.https.onRequest(async (request, response) => {
    if (request.method === "GET") {
      // Handle GET request
      response.status(200).send({
        label: "Your Store Name",
        icon: "https://your-store-icon-url.com/icon.png",
      });
    } else if (request.method === "POST") {
      // Handle POST request
      const { account } = request.body;
      if (!account) {
        response.status(400).send("Missing account");
        return;
      }

      const sender = new PublicKey(account);
      const connection = new Connection("https://api.mainnet-beta.solana.com");

      // Create a simple SOL transfer transaction
      const transaction = new Transaction().add(
        SystemProgram.transfer({
          fromPubkey: sender,
          toPubkey: MERCHANT_WALLET,
          lamports: LAMPORTS_PER_SOL / 100, // 0.01 SOL
        }),
      );

      // You should set the correct blockhash in a production environment
      transaction.recentBlockhash =
        "GfVcyD4kkTrj4bKc7WA9sZCin9JDbw2EVkAvEXnAvqNY";
      transaction.feePayer = sender;

      const serializedTransaction = transaction.serialize({
        requireAllSignatures: false,
      });
      const base64Transaction = serializedTransaction.toString("base64");

      response.status(200).send({
        transaction: base64Transaction,
        message: "Thanks for your purchase!",
      });
    } else {
      response.status(405).send("Method Not Allowed");
    }
  });
  // Write your code above!
});
