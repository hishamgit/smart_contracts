/// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Vending_Machine{
	address public owner;
	mapping (address => uint) public donutBalance;

	constructor(){
		owner=msg.sender;
		donutBalance[address(this)]=100;
	}
	function getVendingMachinebalance() public view returns (uint){
        return donutBalance[address(this)];
	}
	function restock(uint amount) public{
		require(msg.sender==owner,"only owner can restock");
		donutBalance[address(this)]+=amount;
	}
	function purchase(uint amount) public payable{
		require(msg.value>=amount*2 ether,"u must pay 2 ether for a donut");
		require(donutBalance[address(this)]>= amount,"Not enough donuts in stock");
		donutBalance[address(this)]-= amount;
		donutBalance[msg.sender]+= amount;
	}

}

  
