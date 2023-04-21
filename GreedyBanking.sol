pragma solidity >=0.4.22 <=0.8.17;
//MIT licence
//bank contract with fees after first deposit. Contract is exploitable, can withdraw full account balance and then deposite it again plus your deposite to avoide my fees!
contract GreedyBanker {

    mapping(address=>uint) balances;
    uint fees;
    address owner;

    constructor(){
        owner = msg.sender;
    }



    receive() external payable {
        if (balances[msg.sender]==0){
            balances[msg.sender]+=msg.value;
        }
        else{
            require(msg.value >1000);
            fees+=1000;
            balances[msg.sender]+=msg.value;
            balances[msg.sender]-=1000;
        }
    }

    fallback() external payable {
        fees+=msg.value;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender]>=amount);
        address payable to = payable(msg.sender);
        balances[msg.sender]-=amount;
        (bool sent, ) = to.call{value: amount}("");
        require(sent, "transfer failed");
    }

    function collectFees() external {
        require(msg.sender == owner && fees >0);
        uint tempfees = fees;
        fees = 0;
        (bool sent, ) = payable(owner).call{value: tempfees}("");
        require(sent, "transfer failed");
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
