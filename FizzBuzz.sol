pragma solidity >=0.4.22 <=0.8.17;
//mit licence, emits fizz when divisible by 3 and buzz when divisible by 5. Emits fizzbuz for both. 
contract FizzBuzz {
    uint count = 0;

    event Fizz(address sender, uint256 indexed count);
    event Buzz(address sender, uint256 indexed count);
    event FizzAndBuzz(address sender, uint256 indexed count);
    function increment() public {
        // Write your code here
        count+=1;
        if(count%3 == 0 && count%5 == 0 ){
            emit FizzAndBuzz(msg.sender, count);
        }
        else if (count%3 == 0){
            emit Fizz(msg.sender, count);
        }
            
        else if (count%5 == 0){
            emit Buzz(msg.sender, count);
        }
            
    }
}
