import fs from "fs";
import express from "express";
import { getData } from "./dataModel.js";
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const mock_data = JSON.parse(fs.readFileSync("../../mock-data.json"));

app.post("/dsep/search", (req, res) => {
  if(req.query.q === undefined) {
    res.status(400);
    res.send("Error\n");
    return;
  }

  const techs = (req.query.q instanceof Array) ? req.query.q : [req.query.q];
  console.log(techs);

  // TODO: get mock_data from BAP
  let userData = getData(techs, mock_data);
  res.json(userData);
});
app.listen(3000, () => console.log("Running on port 3000"));
