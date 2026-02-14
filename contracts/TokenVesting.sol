// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenVesting is Ownable {
    IERC20 public immutable token;
    address public beneficiary;

    uint256 public start;
    uint256 public cliff;
    uint256 public duration;
    uint256 public totalAmount;
    uint256 public released;

    constructor(
        address _token,
        address _beneficiary,
        uint256 _start,
        uint256 _cliffDuration,
        uint256 _duration,
        uint256 _totalAmount
    ) Ownable(msg.sender) {
        require(_beneficiary != address(0), "Invalid beneficiary");
        require(_duration > 0, "Duration must be > 0");

        token = IERC20(_token);
        beneficiary = _beneficiary;
        start = _start;
        cliff = _start + _cliffDuration;
        duration = _duration;
        totalAmount = _totalAmount;
    }

    function releasableAmount() public view returns (uint256) {
        if (block.timestamp < cliff) {
            return 0;
        } else if (block.timestamp >= start + duration) {
            return totalAmount - released;
        } else {
            uint256 vested = (totalAmount *
                (block.timestamp - start)) / duration;
            return vested - released;
        }
    }

    function release() external {
        uint256 amount = releasableAmount();
        require(amount > 0, "No tokens to release");

        released += amount;
        token.transfer(beneficiary, amount);
    }
}

