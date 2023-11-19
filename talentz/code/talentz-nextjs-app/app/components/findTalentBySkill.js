const getUsersFromResponse = (jsonResponse) => {
  console.log("responses :", jsonResponse);
  if (jsonResponse && jsonResponse.responses && jsonResponse.responses.length > 0) {
    const catalog = jsonResponse.responses[0].message.catalog;

    if (catalog && catalog.users) {
      return catalog.users;
    } else {
      console.error("Catalog does not contain the 'users' array.");
    }
  } else {
    console.error("Invalid JSON response format or empty response.");
  }

  return [];
};

const findTalent = async (data, operation) => {
  const apiUrl = 'http://localhost:5003' + "/" + operation;
  // const apiUrl = 'https://ps-bap-client.becknprotocol.io/search?=php';

  const jsonData = {
    "context": {
      "domain": "dsep:talent",
      // "domain": "onest:expert-connect",
      "action": "search",
      "version": "1.1.0",
      "bap_id": "mulearn-hackninjas-bap",
      // "bap_id": "beckn-sandbox-bpp.becknprotocol.io",
      "bap_uri": "https://mulearn-hackninjas-bap.loca.lt",
      // "bap_uri": "https://sandbox-bpp-network.becknprotocol.io",
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
      "timestamp": "2022-12-15T15:38:16.226Z",
      "message_id": "64109204-bdff-4af6-a76b-5a33f8aa8675",
      "transaction_id": "bdb5ba09-2241-4f00-b434-73466cd06228"
    },
    "message": {
      "intent": {
        "item": {
          "tags": [
            {
              "descriptor": {
                "name": "skills"
              },
              "list": data.map(value => ({ "value": value.value }))
            }
          ]
        }
      }
    }
  };

  try {
    console.log("requesting : ", jsonData);
    const response = await fetch(apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(jsonData),
    });

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const data = await response.json();

    const allUsers = getUsersFromResponse(data);

    return allUsers;

  } catch (error) {

    console.error('Error:', error);
    throw error;
  }
}

export default findTalent;
