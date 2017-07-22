var CoolICOToken = artifacts.require("./CoolICOToken.sol");

module.exports = function(deployer) {
  deployer.deploy(CoolICOToken);
};
