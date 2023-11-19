- I have contributed in building BAP, BPP, and the server application in back-end.
configured bpp
- I worked on configuring BPP and BAP of beckn protocol. I had to go through lots of challenges before getting a working BPP (Beckn Provider Platform) Running. I also worked in collaboration with my team members to test and integrate Beckn protocol with all other pieces of the application.

## server-bpp
A server side application for data fetching and send becknified data to BAP.
Beckn is open source decentralised open protocol. when request reach to BPP, BPP trigger webhook. webhook call server-bpp with queries.server checking queries, are right Schema. server respond with data and webhook callback trigger to BPP client. then BPP send data to BAP.
