// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConverter{

        function getPrice()internal  view returns(uint256) {
        //ABI
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,)=priceFeed.latestRoundData();
        //ETh in terms of USD
        //3000.0000000
        return uint256(answer * 1e10);
        
    }
    function getVersion() internal  view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount)internal  view returns (uint256) {
        uint256 ethPrice = getPrice();
        // 3000_000000000000000000= ETH/USD price
        // 1_000000000000000000 ETH
        uint256 ethAmountInUsd = (ethPrice*ethAmount)/1e18;
        //2999.999999999999999999
        //but in solidity it will return 3000 that is correct
        
        return ethAmountInUsd;



    }

}