const A = artifacts.require('A')
const B = artifacts.require('B')

module.exports = function (deployer) {
    deployer.deploy(B)
    .then(() => B.deployed())
    .then(() => deployer.deploy(A, B.address))
};