// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { TurboVerifier } from "./Verifier.sol";

contract NoirExample {
    uint256 public number;

    function verifyProof(bytes calldata proof) public {
        TurboVerifier.verify(proof);
    }
}
