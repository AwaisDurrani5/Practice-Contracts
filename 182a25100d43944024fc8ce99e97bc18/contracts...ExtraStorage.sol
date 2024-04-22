// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./simpleStorage.sol";

contract ExtraStorage is simplestorage {
    // +5 to any number store function store
    // override
    // virtual override

    function store(uint256 _favoriteNumber) public override  {
        FavoriteNumber = _favoriteNumber + 5;
    }
    


}