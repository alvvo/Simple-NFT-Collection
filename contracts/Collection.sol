pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Collection is ERC721URIStorage, Ownable {

    uint256 public globalMinted;

    constructor(
        address owner,
        string memory name,
        string memory symbol
    ) Ownable() ERC721(name, symbol) {
        transferOwnership(owner);
    }

    function mint(address to, string memory tokenURI) public onlyOwner{
        _safeMint(to,globalMinted);
        _setTokenURI(globalMinted, tokenURI);
        globalMinted++;
    }

    function burn(uint256 tokenId) public {
        require(ownerOf(tokenId) == msg.sender, "Not owner");
        _burn(tokenId);
    }
}