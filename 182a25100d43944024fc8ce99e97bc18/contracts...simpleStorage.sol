// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; 
// current version 0.8.18 (for only 0.8.7/for higher then ^0.8.7/for specific >=0.8.7 <0.9.0)

//EVM ethereum virtual machine
// EVM compatibale blockchains (avalanche, fantom, polygon)
contract simplestorage {

    // this gets initialize to zero!
    uint256 FavoriteNumber;
    
    mapping (string=> uint256) public nameToFavoriteNumbers;
    struct people{
        uint256 FavoriteNumber;
        string name;
    }
    //uint256[] public FavoriteNumberList;
    people[] public People;

    function store(uint256 _favoriteNumber) public virtual  {
        FavoriteNumber=_favoriteNumber;
        

    }
    function retrieve() public view returns(uint256){
        return FavoriteNumber;
    }
    // calldata , memory , storage(struct,array ,mapping need to be givin the memory or calldata parameter)
    function addperson(string memory _name, uint256 _favoriteNumber) public {
        //people memory newperson = people({FavoriteNumber: _favoriteNumber, name:_name});
        //People.push(newperson);
        //or we can do it like 
        //people memory newperson = people( _favoriteNumber, _name});
        //or

        People.push(people(_favoriteNumber,_name));
        nameToFavoriteNumbers[_name]= _favoriteNumber;
    }

}
//0xd9145CCE52D386f254917e481eB44e9943F39138