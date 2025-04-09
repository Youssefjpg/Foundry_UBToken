// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/UBToken.sol";

contract UBTokenTest is Test {
    UBToken token;
    address deployer = address(1);
    address recipient = address(2);

    function setUp() public {
        vm.prank(deployer);
        token = new UBToken("Universitity or Bridgeport Token", "UBT", 1_000_000 * 10 ** 18);
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 1_000_000 * 10 ** 18);
        assertEq(token.balanceOf(deployer), 1_000_000 * 10 ** 18);
    }

    function testTransfer() public {
        vm.startPrank(deployer);
        token.transfer(recipient, 100 * 10 ** 18);
        vm.stopPrank();

        assertEq(token.balanceOf(recipient), 100 * 10 ** 18);
        assertEq(token.balanceOf(deployer), (1_000_000 - 100) * 10 ** 18);
    }
}
