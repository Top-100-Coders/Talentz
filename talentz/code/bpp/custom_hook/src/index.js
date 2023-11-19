import express from 'express';

let app = express();
const ACKMESSAGE = '{"message":{"ack":{"status":"ACK"}}}';
const BPP_CLIENT = "http://localhost:6003/"

app.use(express.json());

function giveNack(res, err) {
  res.send(JSON.stringify({message: {ack: {status: "NACK", reason: err}}}))
}

async function returnResponse(endpoint, msg) {
  return await fetch(BPP_CLIENT + endpoint, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(msg),
  })
}

function buildResponse(action, message, context = {}) {
  return {context: {version: "0.9.4", action: action, ...context}, message: message}
}

const handlers = {
  search: async (context, query) => {
    console.log("Recieved request.....\n\n\n");
    console.log(context);
    console.log(query);
  }
};

app.post('/', (req, res) => {
  const body = req.body;
  const to_call = handlers[body.context.action];
  if(to_call == undefined) {
    giveNack(res, "Unsupported");
  }
  to_call(body.context, body.message).then(() => {});

  res.send(ACKMESSAGE);
});

app.listen(3000);

