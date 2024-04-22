//Get funds from users
//withdraw funds
// set a minimum funding value is USD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

// constatnt ,immutable 
// custom error
error NotOwner();

contract FundME{

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD=50 * 1e18;

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable {
        require (msg.value.getConversionRate() >= MINIMUM_USD,"didn't send enough!");
        // wat to be able to set a minimum fund amount in USD
        // 1. how do we send eth to this contract
        //require(getConversionRate(msg.value)>=minimumUsd,"didn't send enough!");
        //msg.value with have 18 decimal values
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]+=msg.value;

    }
    
    function withdraw() public onlyOwner{

        //for loop
        //[1,2,3,4,]
        // 0 index =1 ,1 index=2 ......
        /* starting index ,ending index, step amount*/ 
        for(uint256 funderIndex= 0; funderIndex < funders.length; funderIndex++ ){
            address funder=funders[funderIndex];
            addressToAmountFunded[funder]=0;

        }
        // reset the array
        funders = new address[](0);
        // actually withdraw the funds

        // call:- forward all gass or set gas, and returns boolean used for sending ETH
        (bool callSuccess, )=payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");


    }

    modifier  onlyOwner{
       //require(msg.sender==i_owner ,"Sender is not the owner!"); (BEFOR THE CUTOM ERROR)
       if (msg.sender != i_owner) {revert NotOwner();} // more efficient less gas
        _;
        // _; means runs the rest. if it wass above statement 
        //it means run all functions the check statement

    }

    receive() external payable{
        fund();
    }

    fallback() external payable {
        fund();
    }
}