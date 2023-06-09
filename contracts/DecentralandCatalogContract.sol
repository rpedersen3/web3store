// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity >=0.8.0;

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import '@openzeppelin/contracts/access/Ownable.sol';
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./ERC6059.sol";
import "./ERC721CatalogExtension.sol";
import "./IERC721CollectionMetadata.sol";
//import "hardhat/console.sol";


contract DecentralandCatalogContract is ERC721CatalogExtension  {
    
    using Strings for uint256;
    using Counters for Counters.Counter;


    Counters.Counter private _tokenIdCounter;

    mapping(address => uint256) public mintedWallets; // this is a list of addresses

    constructor(string memory name_, string memory symbol_) payable ERC6059 (name_, symbol_)   {
        _tokenIdCounter.increment();
    }
    

    function mint(string memory uri) external payable  {
        //console.log("minting it");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();

        //console.log(string.concat("token id: ", Strings.toString(tokenId)));

        mintedWallets[msg.sender]++;
        // from ERC721 contract
        _safeMint(msg.sender, tokenId);

        _setTokenURI(tokenId, uri);
        
    }





}