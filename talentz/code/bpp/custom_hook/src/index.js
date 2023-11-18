import express from 'express';

let app = express();
const ACKMESSAGE = '{"message":{"ack":{"status":"ACK"}}}';
const BPP_CLIENT = "http://localhost:6003/"

app.post('/', (req, res) => {
  console.log("Recieved message\n\n\n")
  console.log(req)
  console.log(res)

  res.send(ACKMESSAGE);
});

app.listen(3000);

