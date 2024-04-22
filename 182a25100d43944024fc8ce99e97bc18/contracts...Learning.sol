// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract monkey_D{
    uint256 public favoriteGear;

    mapping (string=>uint256) public NameToFavoriteGear;
    struct Gear{
        uint256 favoriteGear;
        string Name;
        
    }
    Gear[] public gear;

    function StoreGear ( uint256 _favoriteGear)public {
        favoriteGear=_favoriteGear;

    }

    function retrieve() public view returns (uint256){
        return favoriteGear;
    }

    function ADD_FAV_Gear (string memory _name, uint256 _favoriteGear) public {
        gear.push(Gear(_favoriteGear,_name));
        NameToFavoriteGear[_name]=_favoriteGear;
    }



    
}