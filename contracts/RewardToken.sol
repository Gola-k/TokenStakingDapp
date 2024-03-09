// contracts/RewardToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RewardToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("RewardToken", "RWT") {
        _mint(msg.sender, initialSupply * 10**18);
    }

    function burnStTokens(address account, uint256 amount) external {
        _burn(account, amount * 10**18);
    }

    function mintAndTransfer(address to,uint256 amount) external {
        _mint(address(this), amount * 10**18);
        bool success = transfer(to,amount);
        require(success, "Transfer for stToken failed");
    }
}


//10000000000000000
// 0x7Cc2dc6C724382B70f141035BeCCAE0560643890