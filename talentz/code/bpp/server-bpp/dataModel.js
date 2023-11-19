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

function scoreCoder(coder, techs) {
  const skills = coder.categories;
  // Note: techs is returned by OpenAI. It is sorted in ascending order of importance
  return techs.reduce(
    (acc, t, i) =>
      acc + skills.includes(t) * (i + 1),
    0,
  )
}

export function getData(techs, from) {
  const coders = from.message.catalog['bpp/providers'];

  // Sort by score
  const scored = coders.map((coder, i) =>
    [coder, scoreCoder(coder, techs)]);
  scored.sort(([a_c, a], [b_c, b]) => a < b ? 1 : (a === b ? 0 : -1));

  let res = structuredClone(template);
  res.message.catalog['bpp/providers'] = scored
    .map(([coder, score]) => {
      return {
        ...coder,
        tags: {
          ...coder.tags,
          score: score,
        },
      };
    })
    .filter(coder => coder.tags.score > 0);
  return res;
};
