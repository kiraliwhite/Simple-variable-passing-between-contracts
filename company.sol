// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./phoneStore.sol";

contract company {
    phoneStore[] public branch;

    //Open a new branch phoneStore(create a new contract)
    function openBranch() public {
        phoneStore newPhoneStore = new phoneStore();
        branch.push(newPhoneStore);
    }

    //send value to another contract
    function setBranchStoreNumber(uint _branchNum,uint _BranchStoreNumber) public {
        branch[_branchNum].setStoreNumber(_BranchStoreNumber);
    }

    //get value from another contract
    function getBranchStoreNumber(uint _branchNum) public view returns(uint) {
        return branch[_branchNum].StoreNumber();
    }

    //Send data to a specific branch, send phoneName and serialNumber.(variable passing between contracts)
    function sendDataToBranch(uint _branchNum ,string memory _phoneName,uint _serial) public virtual {
        branch[_branchNum].sellPhone(_phoneName,_serial);
    }

    //get two value from another contract
    function getDataFromBranch(uint _branchNum, uint _phoneGroupIndex) public view returns(string memory phoneName,uint serial) {
        return branch[_branchNum].phoneGroup(_phoneGroupIndex);
    }
}
