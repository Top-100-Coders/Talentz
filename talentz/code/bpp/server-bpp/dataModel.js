//schema sample for on_search
let template = {
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
    catalog: {
      'bpp/descriptor': {
        name: 'Coders',
      },
    },
  },
};

export function getData(techs, from) {
  const userlist = from.message.catalog['bpp/providers'];
  let res = structuredClone(template);
  res.message.catalog['bpp/providers'] =
    userlist.filter(u =>
      techs.every(t => u.categories.includes(t)));
  return res;
};

