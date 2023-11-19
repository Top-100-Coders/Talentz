// Buffer wrapping is reccommended
import OpenAI from 'openai';
import "dotenv/config";
import similarity from 'string-similarity';
import fs from 'fs';

const openai = new OpenAI({
  apiKey: process.env.OPENAI_SECRET_KEY,
});

const initial_prompt = [
  {role: 'user', content: 'You are a consultant helping small buisinesses such as shops to set up a developer team and build their dream applications, websites etc.'}
];
const model = "gpt-3.5-turbo-1106";

function getQuestion(request) {
  return `One of our clients has a request. It is given in the next line. Suggest him what all domains/skills he should be looking for when hiring developers to build his dream. Return your response in JSON. Return the various domains in the key "domains". The values should be sorted by importance in ascending order:
  "${request}"`
};

export async function getDomains(request) {
  // Basic prompt injection defence
  if(request.includes("\"") || request.includes("\n") || request.includes("'")) {
    throw "Possibly malicious input. Remove \", \' and newlines from your input";
  }

  const completion = await openai.chat.completions.create({
    model: model,
    response_format: {
      type: "json_object",
    },
    messages: [
    ...initial_prompt,
    {
      role: 'user',
      content: getQuestion(request),
    }],
  });
  const result = JSON.parse(completion.choices[0].message.content);

  // Let's all pray to god ChatGPT doesn't break its "API"
  return mapToRealDomains(result.domains);
}

const real_domains = JSON.parse(fs.readFileSync("../../domains.json"));
function mapToRealDomains(domains) {
  return domains.map(d =>
           similarity.findBestMatch(d, real_domains).bestMatch.target)
}
