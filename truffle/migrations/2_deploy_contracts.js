var InsuranceToken = artifacts.require("./InsuranceToken.sol");
var CoolICOToken = artifacts.require("./CoolICOToken.sol");
var Crowdsale = artifacts.require("./Crowdsale.sol");

module.exports = function(deployer) {
  deployer.deploy(InsuranceToken).then(function () {
      deployer.deploy(CoolICOToken).then(function () {
          deployer.deploy(Crowdsale, [10, 5, 2, InsuranceToken, CoolICOToken]);
      });
  });
};
