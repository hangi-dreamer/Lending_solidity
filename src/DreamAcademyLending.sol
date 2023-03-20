// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IPriceOracle {
    function setPrice(address token, uint256 price) external returns (uint);
}


contract DreamOracle {
   address public operator;
   mapping(address=>uint256) prices;


   constructor() {
       operator = msg.sender;
   }


   function getPrice(address token) external view returns (uint256) {
       require(prices[token] != 0, "the price cannot be zero");
       return prices[token];
   }


   function setPrice(address token, uint256 price) external returns (uint) {
       require(msg.sender == operator, "only operator can set the price");
       return prices[token] = price;
   }
}

contract DreamAcademyLending {
    constructor (IPriceOracle oracle, address token) {}
    function initializeLendingProtocol(address token) payable external {}
    function deposit(address tokenAddress, uint256 amount) payable external {}
    function borrow(address tokenAddress, uint256 amount) payable external {}
    function repay(address tokenAddress, uint256 amount) payable external {}
    function liquidate(address user, address tokenAddress, uint256 amount) payable external {}
    function withdraw(address tokenAddress, uint256 amount) payable external {}
    function getAccruedSupplyAmount(address token) payable external returns (uint) {}

}
