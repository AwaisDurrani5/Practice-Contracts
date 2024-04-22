// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./simpleStorage.sol";

contract storageFactory{

    simplestorage[] public simpleStorageArray;

    function creatSimpleStorageContract() public {
        simplestorage  simpleStorage = new simplestorage();
        simpleStorageArray.push(simpleStorage);


    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //address
        //ABI - Application binary Interface
        simplestorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
        // or we can write { simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);}

    }
    function sfGet( uint256 _simpleStorageIndex) public view returns (uint256){
        simplestorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve(); 
        // or we can just  write{ return simpleStorageArray[_simpleStorageIndex].retrieve();}

    }

}

