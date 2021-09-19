// SPDX-License-Identifier: MIT

// solidity verision
pragma solidity >=0.6.0 <=0.9.0;

// object (contract name)
contract SimpleStorage {
    
    
    /*
    uint256 favoriteNumber = 5;     // unsigned integer, blank is initialize to 0 or NULL
    bool favorieBool = true;
    string favoriteString = "String";
    int256 favoriteInt = -5;
    address favoriteAddress = 0x55953d49052050a4300Cb94207c4695Fdb865915;
    bytes32 favoriteBytes = "cat";      //32 is max
    */
    // uint256 public favoriteNumber;
    
    uint256 favoriteNumber;
    bool favoriteBool;
    
    // struct
    struct People {
        uint256 favoriteNumber;  // index 0
        string name;    // index 1
    }
    
    // type visibility name of variabl
    
    // People public person = People({favoriteNumber:2, name: "Elvin"});
    
    People[] public people; //array
    mapping(string => uint256) public nameToFavoriteNumber;
    
    
    // functions, pass in number and make it fave number
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    // view, pure (does some type of math)
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    
    
    // function to add people to array
    // memory = only during runtime, storage = saved
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
        // people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    
    // inject Web3  = metamask
    
    
    
}



/* 

NOTES FOR SOLIDITY:

1. Name solidity verision
2. Name contract. Contract is like a class, defines functions and parameters of Contract
3. different types
4. can make structs , arrays , maps, functions
5. view doesn't make a state change
6. memory and storage is where variable will be saved
7. code will get compiled to ETH VM


*/