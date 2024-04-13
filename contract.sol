// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
import "./Ownable.sol";
contract CourseAccess is Ownable {
uint256 public Coursefee; // This is the course fee 
CoursePurchased[] public coursesPurchased;


// this is a constructor and when we deploy our contarct on ethereum, this will permanently get stored on Blockchain and the course fee will be now set to the predfined course fee which the owner of this contract will set.
constructor(uint256 _coursefee) Ownable(msg.sender){
    Coursefee = _coursefee;
}

struct CoursePurchased{
    uint256 fees;
    string email;
    address purchaser;
}



event PaymentRecieved(address user, string memory email, uint256 amount);

// This function will be called and the user will pay fee to call this function, once this is called and the user email will be registerd
function payFee(string memory _email ) public payable{
require(msg.value == Coursefee, "Please pay the aactual amount for this course");
coursesPurchased.push(CoursePurchased(msg.value , _email , msg.sender)); // Here we are collecting all the purchasers data
emit PaymentRecieved(msg.sender , email , msg.value);

}


// this helps the owner of the course to withdraw the money that he got from the course paid through the CRPTO WALLET
function withdrawFunds() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    //Now we will check the numnber of times the user poyed for the course 

    function TotalPaymentByUser(address userAddress) public view returns (CoursePurchased[] memory){
        uint count = 0;
        // here we will iterate throught the coursesPurchased ARRAY and we will check that if the user already exist, increase the counter
        for(uint i = 0; i < coursesPurchased.length ; i++){
            if(coursesPurchased[i].purchaser == userAddress ){
                count++'
            }
        }
        CoursePurchased[] memory userTotalPurchases = new CoursePurchased[](count); // now we are creating a New CoursePurchased ARRAY, with the length COUNT
        uint index = 0
        // AGAIN WE WILL ITERATE IN THE coursesPurchased ARRAY, WE WILL NOW CHECK IF THE USER EXIST IN THE coursesPurchased ARRAY, IF YES THEN WE WILL START POPULATING THE userTotalPurchases 
        for(uint i = 0; i < coursesPurchased.length ; i++){
            if(coursesPurchased[i].purchaser == userAddress ){
               userTotalPurchases[index] =  coursesPurchased[i];
               index++;
            }
    }
    // now we will return the array the contains the all the purchases of the user
    return userTotalPurchases;

}
// NOW THE FUNCTION BELPW WILL GIVE ALL THE TRANSACTIONS FOR THE COURSE

function totalTransactionsFortheCourse() public view returns (CoursePurchased[] memory){
    return coursesPurchased;
}
}