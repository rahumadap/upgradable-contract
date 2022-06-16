const Tokens = artifacts.require('Tokens');
const TokensUpdated = artifacts.require('TokensUpdated');
const Proxy = artifacts.require('Proxy');

module.exports = async function(deployer, network, accounts){
  //Deploy Contracts
  const Tokens = await Tokens.new();
  const proxy = await Proxy.new(Tokens.address);

  //Create Proxy Dog to Fool Truffle
  var proxyDog = await Tokens.at(proxy.address);

  //Set the nr of Tokens through the proxy
  await proxyDog.setNumberOfTokens(10);

  //Tested
  var nrOfTokens = await proxyDog.getNumberOfTokens();
  console.log("Before update: " + nrOfTokens.toNumber());

  //Deploy new version of Tokens
  const TokensUpdated = await TokensUpdated.new();
  proxy.upgrade(TokensUpdated.address);

  //Fool truffle once again. It now thinks proxyDog has all functions.
  proxyDog = await TokensUpdated.at(proxy.address);
  //Initialize proxy state.
  proxyDog.initialize(accounts[0]);

  //Check so that storage remained
  nrOfTokens = await proxyDog.getNumberOfTokens();
  console.log("After update: " + nrOfTokens.toNumber());

  //Set the nr of Tokens through the proxy with NEW FUNC CONTRACT
  await proxyDog.setNumberOfTokens(30);

  //Check so that setNumberOfTokens worked with new func contract.
  nrOfTokens = await proxyDog.getNumberOfTokens();
  console.log("After change: " + nrOfTokens.toNumber());


}
