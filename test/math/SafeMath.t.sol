pragma solidity 0.8.19;

import "forge-std/Test.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

interface SafeMath {
    function safeAdd(uint256, uint256) external pure returns (uint256);
    function safeSub(uint256, uint256) external pure returns (uint256);
    function safeMul(uint256, uint256) external pure returns (uint256);
    function safeDiv(uint256, uint256) external pure returns (uint256);
    function safeMod(uint256, uint256) external pure returns (uint256);
}

contract SafeMathTest is Test {
    SafeMath safe_math;

    function setUp() public {
        safe_math = SafeMath(HuffDeployer.deploy("lib/huffmate/src/math/SafeMath"));
    }

    function test_add_no_rev(uint256 a, uint256 b) public {
        vm.assume(a + b <= type(uint256).max);
        assertEq(safe_math.safeAdd(a, b), a + b);
    }
}
