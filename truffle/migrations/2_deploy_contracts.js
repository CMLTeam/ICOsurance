// var ConvertLib = artifacts.require("./ConvertLib.sol");
// var MetaCoin = artifacts.require("./MetaCoin.sol");
var ERC20Interface = artifacts.require("./ERC20Interface.sol");
var FixedSupplyToken = artifacts.require("./FixedSupplyToken.sol");
var FixedSupplyInsuredToken = artifacts.require("./FixedSupplyInsuredToken.sol");

module.exports = function(deployer) {
  // deployer.deploy(ConvertLib);
  // deployer.link(ConvertLib, MetaCoin);
  // deployer.deploy(MetaCoin);
  deployer.deploy(FixedSupplyToken);
  deployer.deploy(FixedSupplyInsuredToken);
};
