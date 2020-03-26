pragma solidity ^0.4.24;

contract EthertipGateway {

    event Withdraw(address indexed owner, uint value);
    event Deposit(address indexed from, uint value);   

    mapping(uint=>uint) public used;
    address public validator;

    uint public tipToEther = 0.0001 ether;

    constructor (address _validator) public {
        validator = _validator;
    }    

    function () public payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint _id, uint _value, bytes _sig) public {
        bytes32 dataHash = keccak256(validator, _id, _value);
        bytes32 prefixedHash = keccak256("\x19Ethereum Signed Message:\n32", dataHash);
        address recovered = getRecoveredAddress(_sig, prefixedHash);
        require(validator == recovered);
        require(used[_id] < _value);
        
        uint _transfer = (_value - used[_id]) * tipToEther;
        
        used[_id] = _value;
        msg.sender.transfer(_transfer);
        emit Withdraw(msg.sender, _transfer);
    }

    function getRecoveredAddress(bytes sig, bytes32 dataHash)
        internal
        pure
        returns (address addr)
    {
        bytes32 ra;
        bytes32 sa;
        uint8 va;

        // Check the signature length
        if (sig.length != 65) {
          return (0);
        }

        // Divide the signature in r, s and v variables
        assembly {
          ra := mload(add(sig, 32))
          sa := mload(add(sig, 64))
          va := byte(0, mload(add(sig, 96)))
        }

        if (va < 27) {
          va += 27;
        }

        address recoveredAddress = ecrecover(dataHash, va, ra, sa);

        return (recoveredAddress);
    }     

}