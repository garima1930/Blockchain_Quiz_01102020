pragma solidity ^0.4.21;

contract BeachTShirts {
    
    enum State {AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE}
    
    State currentState;
    address private buyer;
    address seller;
    
   
   
    
    constructor (address _buyer , address _seller) {
        
        buyer = _buyer;
        seller = _seller;
        
    }
    
    function confirmPayment() payable {
        require(msg.sender == buyer);
        require(currentState == State.AWAITING_PAYMENT);
        currentState = State.AWAITING_DELIVERY;
        
    }
    
    function confirmDelivery(){
        require(msg.sender == buyer);
         require(currentState == State.AWAITING_DELIVERY);
        seller.send(this.balance);
    }
}
