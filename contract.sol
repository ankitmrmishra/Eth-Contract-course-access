// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
import "./Ownable.sol";
contract CourseAccess is Ownable {
uint256 public Coursefee; // This is the course fee 


// this is a constructor and when we deploy our contarct on ethereum, this will permanently get stored on Blockchain and the course fee will be now set to the predfined course fee which the owner of this contract will set.
constructor(uint256 _coursefee) Ownable(msg.sender){
    Coursefee = _coursefee;
}



event PaymentRecieved(address user, string memory email, uint256 amount);

// This function will be called and the user will pay fee to call this function, once this is called and the user email will be registerd
function payFee(string memory _email ) public payable{
require(msg.value == Coursefee, "Please pay the aactual amount for this course");
emit PaymentRecieved(msg.sender , email , msg.value);

}

}
