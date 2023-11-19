import express from "express";
import { getData } from "./dataModel.js";
const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//schema sample for on_search
let data = {
  context: {
    domain: "dsep:talent",
    action: "on_search",
    version: "1.1.0",
    bap_id: "mulearn-hackninjas-bap",
    bap_uri: "https://mulearn-hackninjas-bap.loca.it",
    location: {
      country: {
        name: "India",
        code: "IND",
      },
      city: {
        name: "Bangalore",
        code: "std:080",
      },
    },
    timestamp: "2023-11-15T15:38:16.226Z",
    message_id: "64109204-bdff-4af6-a76b-5a33f8aa8675",
    transaction_id: "bdb5ba09-2241-4f00-b434-73466cd06228",
  },
  message: {
    catalog: {},
  },
};
let queryValue;
let queryType
app.post("/dsep/search", (req, res) => {
  // console.log(req.body.message.intent.item, "body");
  if (req.body?.message?.intent?.item?.tags[0]?.list) {
    queryValue = req.body.message.intent.item.tags[0].list;
    queryType='array'
  }
  if (req.body?.message?.intent?.location) {
    queryValue = req.body?.message?.intent?.location?.city?.name;
    queryType='location'
    console.log("its", queryValue);
  }
  if (req.body?.message?.intent?.item?.descriptor?.name) {
    queryValue=req.body?.message?.intent?.item?.descriptor?.name
    queryType='name'
  }

  console.log(queryValue);
  if (queryValue) {
    let userData = getData(queryValue,queryType);
    data.message.catalog.users = userData;
    console.log(data.message.catalog);
    res.json(data);
  } else {
    let noData = ["no users"];
    data.message.catalog = noData;
    res.json(data);
  }
});
app.listen(PORT, () => console.log(`server listening in ${PORT}`));
