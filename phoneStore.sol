// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract phoneStore {
    uint public StoreNumber;
    function setStoreNumber(uint _num) public {
        StoreNumber = _num;
    }
    /*  
    //** When the variable is set to public, the view function can be omitted **
    function getStoreNumber() public view returns (uint) {
        return StoreNumber;
    }
    */
    struct Phone {
        string phoneName;
        uint serialNumber;
    }

    Phone public iphone11 = Phone({ phoneName: "iphone11", serialNumber: 7342517 });

    Phone[] public phoneGroup;

    mapping(uint => string) public serialToName;

    function sellPhone(string memory _name, uint _serial) public {
        //Phone memory temp1 = Phone(_name,_serial);
        //phoneGroup.push(temp1);
        //** The above two lines are equal to the following line **
        phoneGroup.push(Phone(_name,_serial));

        serialToName[_serial] = _name;
    }

}
