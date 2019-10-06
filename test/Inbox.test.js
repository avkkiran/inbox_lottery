const assert = require("assert");
const ganache = require("ganache-cli");
const Web3 = require("web3");
const INITAL_MSG = "Hi there!!!";
// const web3 = new Web3(ganache.provider());

const provider = ganache.provider();
const web3 = new Web3(provider);

const { interface, bytecode } = require("../compile.js");

// using promises
// beforeEach(() => {
//   web3.eth.getAccounts()
//     .then(fetchedAccounts => {
//       console.log(fetchedAccounts);
//     });
// });

// using async and await
let accounts;
let inbox;
beforeEach(async () => {
  accounts = await web3.eth.getAccounts();
  inbox = await new web3.eth.Contract(JSON.parse(interface))
              .deploy({ data: bytecode, arguments: [INITAL_MSG]})
              .send({ from: accounts[0], gas: "1000000"});
  // inbox.setProvider(provider);
});

describe("Inbox", () => {
  it("deploys a contract", () => {
    // console.log(inbox);
    assert.ok(inbox.options.address);
  });
  it("has a default message", async () => {
    const msg = await inbox.methods.message().call();
    assert.equal(msg, INITAL_MSG);
  });
  it("set message", async () => {
    await inbox.methods.setMessage("Hi there edited!!!").send({ from: accounts[0] });
    const msg = await inbox.methods.message().call();
    assert.equal(msg, "Hi there edited!!!");
  });
});
