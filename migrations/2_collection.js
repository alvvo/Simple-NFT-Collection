const Collection = artifacts.require("Collection");
const DeployData = require("../deploy-data.json");

module.exports = function (deployer) {
  deployer.deploy(
    Collection,
    DeployData.deploy.owner,
    DeployData.deploy.name,
    DeployData.deploy.symbol
  );
};
