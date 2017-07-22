// var ConvertLib = artifacts.require("./ConvertLib.sol");
// var MetaCoin = artifacts.require("./MetaCoin.sol");
var ERC20Interface = artifacts.require("./ERC20Interface.sol");
var FixedSupplyToken = artifacts.require("./FixedSupplyToken.sol");

module.exports = function(deployer) {
  // deployer.deploy(ConvertLib);
  // deployer.link(ConvertLib, MetaCoin);
  // deployer.deploy(MetaCoin);
  deployer.deploy(ERC20Interface);
  deployer.deploy(FixedSupplyToken);
};
