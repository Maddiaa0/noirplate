// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NoirExample.sol";
import {NoirProver} from "foundry-noir/Noir.sol";

contract CounterTest is Test {
    NoirProver public noirProver;
    NoirExample public noirExample;

    function setUp() public {
        noirExample = new NoirExample();
        noirProver = new NoirProver();
    }

    function testGenerateAndVerifyProof() public {
        noirProver
            .with_input(NoirProver.CircuitInput("x", 1))
            .with_public_input(NoirProver.CircuitInput("y", 2))
            .with_nargo_project_path("./circuits");

        bytes memory proof = noirProver.generate_proof();
        noirExample.verifyProof(proof);
    }

}
