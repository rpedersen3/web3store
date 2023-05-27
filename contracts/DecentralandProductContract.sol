// SPDX-License-Identifier: CC0-1.0

pragma solidity >=0.8.0;

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import '@openzeppelin/contracts/access/Ownable.sol';
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import "./IERC721ProductExtension.sol";
import "./ERC721ProductExtension.sol";
import "./ERC6059.sol";


// using ERC721URIStorage instead of ERC721 Metadata contract interface
contract DecentralandProductContract is ERC721ProductExtension   {
    
    using Strings for uint256;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    mapping(address => uint256) public mintedWallets; // this is a list of addresses

    constructor(string memory name_, string memory symbol_) payable ERC6059(name_, symbol_) {
        _tokenIdCounter.increment();
    }



    // payable => this function deals with money
    // require => put in check statements as pre-conditions
    //    must be enabled
    //    sender can create only one nft
    //    make sure they are putting in the correct price for the mint
    function mint(string memory uri) external payable {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();

        mintedWallets[msg.sender]++;

        // from ERC721 contract
        _safeMint(msg.sender, tokenId);

        _setTokenURI(tokenId, uri);
    }








    function ownerOf(
        uint256 tokenId
    ) public view virtual override (ERC721ProductExtension)   returns (address) {
        return super.ownerOf(tokenId);
    }


}