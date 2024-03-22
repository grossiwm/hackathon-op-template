// SPDX-License-Identifier: MIT
pragma solidity >0.8.17 <0.8.20;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "./ParticipationTitle.sol";

contract NewStake is ERC20 {
    mapping(address => uint256) public staked; //carteira que coloca ou tira do stake
    mapping(address => uint256) private stakeTime; //tempo de stack em segundos
    address owner;
    constructor() ERC20("Stake", "FSK") {
        owner = msg.sender;
        _mint(msg.sender, 1000e12);
    }

    ParticipationTitle nft;
    uint256 private timeStake;

    function startStake() public {
        timeStake = block.timestamp;
    }

    function stopStake() public view returns (bool) {
        if (block.timestamp >= timeStake + 10) {
            return true;
        } else return false;
    }
    function claimNFT() public view {
        require(stopStake() == true);
    }
}
