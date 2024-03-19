// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script, console2} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";
import {Stake} from "../src/Stake.sol";
import {ParticipationTitle} from "../src/ParticipationTitle.sol";


contract ParticipationTitleDeployScript is Script {
    ParticipationTitle title;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);
        title = new ParticipationTitle();
        console2.log("ParticipationTitle address: ", address(title));

        vm.stopBroadcast();
    }
}

contract StakeDeployScript is Script {
    Stake stake;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        stake = new Stake();
        console2.log("Stake address: ", address(stake));

        vm.stopBroadcast();
    }
}

contract Local is Script {
    Counter counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        counter = new Counter();
        console2.log("Counter address: ", address(counter));

        vm.stopBroadcast();
    }
}
