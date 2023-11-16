# Beckn 

### Getting Started

The participants are required to build their own BPP and also a BAP and integrate this with the mulearn api,resulting in a application with a stunning 

# Resources

For understanding all API endpoints.
    - https://developers.becknprotocol.io/docs/local-retail-specification/api-reference/

The Current Implementation Of The BPP used in the hackathon
    - https://github.com/Mishalabdullah/beckn-protocol

**BAP RUNNING PARTS**

1. Beckn Protocol Server :- 
    This repo is used for running docker containers of mongo, redis and rabbitmq these are the docker containers which are required for
    running the protocol server.
    **In order to run the protocol server read the README.md file and follow the instructions**

    - https://github.com/beckn/protocol-server

2. Beckn protocol webhook
   This repo is as the name suggest is used for enableing the webhook, if you need understand more about the webhook you should visit the 
   archeitecture of beckn protocol so that you would be able to understand its workflow.The webhook is mainly used to trigger the response so that 
   the response it send to the request to beckn network.
    
    - https://github.com/beckn/beckn-sandbox-webhook 
3. Beckn-sandbox

    Just run this repo and then the request it actually passed through the sandbox 

    - https://github.com/beckn/beckn-sandbox

This is the website for viewing the example of Beckn Protocol
    - https://experience-guide.becknprotocol.io/

