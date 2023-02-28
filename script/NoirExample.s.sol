// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {NoirExample} from "../src/NoirExample.sol";

contract NoirExampleScript is Script {
    function run() public returns (NoirExample noirExample) {
        vm.broadcast();
        noirExample = new NoirExample();
    }
}
