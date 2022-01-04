pragma solidity >=0.6.0 <0.8.0;


import "./ERC721Claimable.sol";

contract MinterContract{
    ERC721Claimable NFT;
    address public ERC721Address;
    uint256 public index;

    constructor(ERC721Claimable NTFAddress)public{
        NFT = NTFAddress;
        ERC721Address = address(NTFAddress);
        index = NFT.totalSupply();
    }
    // EX1
    function mintATokenForMe()public returns(uint256){
        uint256 id = index;
        NFT.mint(msg.sender, id);
        index++;
        return id;
    }
    

    // EX5
    function mintATokenForMeWithASignature(bytes calldata _signature) public returns (uint256){
        uint256 id = index;
        bytes32 dataToSign = keccak256(abi.encodePacked(msg.sender, tx.origin, ERC721Address));
        address TestAddress = extractAddress(dataToSign,_signature);
        require(TestAddress == tx.origin,"Is not Owner");
        NFT.mint(msg.sender, id);
        index++;
        return id;
    }

    // EX3 it's Work
	function getAddressFromSignature(bytes32 _hash, bytes calldata _signature) public returns (address){
        return extractAddress(_hash,_signature);
    }

    // EX4 it's work
     mapping(address => bool) public IsWhitelist;

    function BeWhiteList(address NewAddress)public{
        IsWhitelist[NewAddress] =true;
    }

	function signerIsWhitelisted(bytes32 _hash, bytes calldata _signature) public returns (bool){
        address TestAddress = extractAddress(_hash,_signature);
        return IsWhitelist[TestAddress];
    }

    function whitelist(address _signer) public returns (bool){
        return IsWhitelist[_signer];
    }




    function extractAddress(bytes32 _hash, bytes memory _signature) 
    internal 
    pure 
    returns (address) {
        bytes32 r;
        bytes32 s;
        uint8 v;
        // Check the signature length
        if (_signature.length != 65) {
            return address(0);
        }
        // Divide the signature in r, s and v variables
        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            r := mload(add(_signature, 32))
            s := mload(add(_signature, 64))
            v := byte(0, mload(add(_signature, 96)))
        }
        // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
        if (v < 27) {
            v += 27;
        }
        // If the version is correct return the signer address
        if (v != 27 && v != 28) {
            return address(0);
        } else {
            // solium-disable-next-line arg-overflow
            return ecrecover(keccak256(
                abi.encodePacked("\x19Ethereum Signed Message:\n32", _hash)
                ), v, r, s);
        }
    }
}