# Beckn 

### Getting Started

The participants are required to build their own BPP and also a BAP and integrate this with the mulearn api,resulting in a application with a stunning 

# Resources

**The becknified json file**

```json
{
    "context": {
        "domain": "dsep:student-connect",
        "action": "search",
        "location": {
            "country": {
                "name": "India",
                "code": "IND"
            },
            "city": {
                "name": "Bangalore",
                "code": "std:080"
            }
        },
        "version": "1.1.0",
        "bap_id": "ps-bap-network.becknprotocol.io",
        "bap_uri": "https://ps-bap-network.becknprotocol.io/",
        "bpp_id": "mulearn-bpp",
        "bpp_uri": "https://network-beckn.loca.lt",
        "transaction_id": "6743e9e2-4fb5-487c-92b7-13ba8018f176",
        "message_id": "6743e9e2-4fb5-487c-92b7-13ba8018f176",
        "timestamp": "2023-07-16T04:41:16Z"
    },
    "message": {
        "intent": {
            "item": {
                "tags": [
                    {
                        "descriptor": {
                            "name": "skills"
                        },
                        "list": [
                            {
                                "value": "Agile"
                            },
                            {
                                "value": "Figma"
                            }
                        ]
                    }
                ]
            }
        }
    }
}

```

### Mulearn Endpoints

#### GET

```bash
    https://mulearn.org/api/v1/get-log/list-ig
```

#### POST
```bash
    https://mulearn.org/api/v1/get-log/list-ig-top100/
    > params:ig_name
```


> For understanding all API endpoints.
    - [developers.becknprotocol.io/docs/](https://developers.becknprotocol.io/docs/local-retail-specification/api-reference/)

> The Current Implementation Of The BPP used in the hackathon
    - [Mishalabdullah/beckn-protocol](https://github.com/Mishalabdullah/beckn-protocol)

### BAP RUNNING PARTS

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

