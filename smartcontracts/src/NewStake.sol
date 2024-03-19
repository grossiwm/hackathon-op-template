// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "./ParticipationTitle.sol";

contract Stake is ERC20 {
    mapping(address => uint256) public staked; //carteira que coloca ou tira do stake
    mapping(address => uint256) private stakeTime; //tempo de stack em segundos

    constructor() ERC20("Stake", "FSK") {
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
        nft = new ParticipationTitle;
        nft.createNFT(msg.sender, name, metadataURI);
    }
}
