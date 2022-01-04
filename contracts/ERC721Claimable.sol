pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract ERC721Claimable is ERC721{
    address public Owner=0xC20b819365e52f0C1bF4e500b3aD44F517EbA32E;
    constructor() public ERC721("MyNTFforTD8",'TD8'){
    }

    modifier onlyAdmin {
        require(Owner == msg.sender,'Not Admin');
        _;
    }

    mapping(address => bool) public isMinter;

    function BeMinter(address newminter) onlyAdmin public{
        isMinter[newminter] = true;
    }
    uint256 public TotalToken =0;

    function mint(address add,uint256 id) public{
        //require(isMinter[msg.sender],'Not Minter');
        //_safeMint(add,id);
        _mint(add,id);
        TotalToken++;
    }
}
