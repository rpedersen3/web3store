pragma solidity >=0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import "./IERC721CollectionMetadata.sol";

abstract contract ERC721CollectionMetadata is ERC721, Ownable, IERC721CollectionMetadata {

    bytes4 private constant _INTERFACE_ID_ERC721CollectionMetadata = 0xbcc08bd1;

    string[] private collectionUris;

    function setCollectionUri(string calldata collectionUri) override external onlyOwner {
        collectionUris.push(collectionUri);
        emit UpdateCollection(collectionUri);
    }

    function getCollectionUri() override external view returns (string memory) {
        uint last = collectionUris.length - 1;
        return collectionUris[last];
    }

    function getCollectionHistory() override external view returns (string[] memory){
        return collectionUris;
    }
}