import fs from "fs";
import express from "express";
import { getData } from "./dataModel.js";
import { getDomains } from "./openai.js";

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const mock_data = JSON.parse(fs.readFileSync("../../mock-data.json"));

app.get("/domains", async (req, res) => {
  if(req.query.q == undefined) {
    res.status(400);
    res.send("Error: Argument q needed");
    return;
  }
  const query = req.query.q;
  res.json(await getDomains(query));
})

app.get("/search", async (req, res) => {
  const query = req.query.q;
  if(typeof query !== "string") {
    res.status(400);
    res.send("Argument `q` is either missing or not a string");
    return;
  }
  const domains = await getDomains(query);

  // TODO: get mock_data from BAP
  let userData = getData(domains, mock_data);
  res.json(userData);
});
app.listen(3000, () => console.log("Running on port 3000"));
