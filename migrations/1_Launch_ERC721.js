/*
const ERC721Launch = artifacts.require("ERC721Claimable");

module.exports = function (deployer) {
  deployer.deploy(ERC721Launch);
};
*/
/*
const ContractLaunch = artifacts.require("MinterContract");

module.exports = function (deployer) {
  deployer.deploy(ContractLaunch,"0x4A8b01da7724a5325af4E4208ac305b681246ca8");
};
*/

const BouncerProxy= artifacts.require("BouncerProxy");

module.exports = function (deployer) {
  deployer.deploy(BouncerProxy);
};
