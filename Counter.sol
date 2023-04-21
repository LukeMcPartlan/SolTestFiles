pragma solidity >=0.4.22 <=0.8.17;
// MIT licence
contract AdvancedCounter {

    mapping (address => mapping(string=>int)) stringOwners;  //problem: the 3 strings in this mapping are not mapped to the addresses.
    mapping(address => int) countOfCounts;
    


    function createCounter(string memory id, int256 value) public {
        // Write your code here
        require(countOfCounts[msg.sender] <3);
        countOfCounts[msg.sender]+=1;
        stringOwners[msg.sender][id] = value;

    }

    function deleteCounter(string memory id) public {
        // Write your code here
        require(stringOwners[msg.sender][id] != 0);
        countOfCounts[msg.sender] -=1;
        stringOwners[msg.sender][id] = 0;        

    }

    function incrementCounter(string memory id) public {
        // Write your code here
        require(stringOwners[msg.sender][id] != 0);
        stringOwners[msg.sender][id] +=1;
    }

    function decrementCounter(string memory id) public {
        // Write your code here
        require(stringOwners[msg.sender][id] != 0);
        stringOwners[msg.sender][id] -=1;
    }

    function getCount(string memory id) public view returns (int256) {
        // Write your code here
        require(stringOwners[msg.sender][id] != 0);
        return stringOwners[msg.sender][id];
        
    }
}
