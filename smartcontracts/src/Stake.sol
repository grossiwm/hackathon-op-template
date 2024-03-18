// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FarmStake is ERC20 {
    mapping(address => uint256) public staked; //carteira que coloca ou tira do stake
    mapping(address => uint256) private stakeTime; //tempo de stake em segundos

    constructor() ERC20("FarmStake", "TEST") {
        _mint(msg.sender, 1000e12);
    }

    //funcao para executar a requisicao
    function claim() public {
        require(staked[msg.sender] > 0, "Quantidade invalida");
        uint256 timeStake = block.timestamp - stakeTime[msg.sender];
        uint256 reward = (staked[msg.sender] * timeStake) / 3.15e7; //Tempo em segundos por ano
        _mint(msg.sender, reward);
        stakeTime[msg.sender] = block.timestamp;
    }

    //funcao para colocar em stake
    function stake(uint256 amount) external {
        require(amount > 0, "Saldo insuficiente");
        require(balanceOf(msg.sender) >= amount, "Quantidade insuficiente");
        _transfer(msg.sender, address(this), amount);

        if (staked[msg.sender] > 0) {
            claim();
        }
        stakeTime[msg.sender] = block.timestamp;
        staked[msg.sender] += amount;
    }

    //funcao para retirar do stake
    function unstake(uint256 amount) external {
        require(amount > 0, "Saldo insuficiente");
        require(balanceOf(msg.sender) >= amount, "Quantidade insuficiente");
        claim();
        staked[msg.sender] -= amount;
        _transfer(address(this), msg.sender, amount);
    }
}
