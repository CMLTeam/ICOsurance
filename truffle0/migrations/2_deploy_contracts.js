var YetAnotherToken = artifacts.require("./YetAnotherToken.sol");
var YetAnotherInsuranceToken = artifacts.require("./YetAnotherInsuranceToken.sol");
var YetAnotherCrowdsale = artifacts.require("./YetAnotherCrowdsale.sol");

module.exports = function(deployer) {
	deployer.deploy(YetAnotherToken);
	deployer.deploy(YetAnotherInsuranceToken);
	deployer.deploy(YetAnotherCrowdsale);
};
