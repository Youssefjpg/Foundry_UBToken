// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/UBToken.sol";

contract UBTokenDeploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        string memory tokenName = "Universitity or Bridgeport Token";
        string memory tokenSymbol = "UBT";
        uint256 initialSupply = 1_000_000 * 10 ** 18;

        UBToken token = new UBToken(tokenName, tokenSymbol, initialSupply);

        token.transfer(0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc, 100 * 10 ** 18);

        vm.stopBroadcast();
    }
}
