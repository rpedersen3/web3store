// SPDX-License-Identifier: CC0-1.0

pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import "./IERC721CollectionMetadata.sol";
import "./ERC721CollectionMetadata.sol";
import "./IERC721ProductExtension.sol";
import "./IERC6059.sol";
import "./ERC6059.sol";

abstract contract ERC721ProductExtension is Ownable, ERC6059, IERC4906, IERC721CollectionMetadata, IERC721ProductExtension {
    
    bytes4 private constant _INTERFACE_ID_ERC721ProductExtension = 0x80ac58ce;
    
    mapping(uint256 => string) private _tokenURIs;

    string[] private collectionUris;

    function ownerOf(
        uint256 tokenId
    ) public view virtual override (ERC6059, IERC721)   returns (address) {
        return super.ownerOf(tokenId);
    }

    
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC6059, IERC165) returns (bool) {
        return
                interfaceId == 0x80ac58ce || 
                interfaceId == type(ERC165).interfaceId ||
                interfaceId == type(ERC721CollectionMetadata).interfaceId ||
                interfaceId == type(IERC6059).interfaceId;
    }

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

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);

        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();

        // If there is no base URI, return the token URI.
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }

        return super.tokenURI(tokenId);
    }

    /**
     * @dev Sets `_tokenURI` as the tokenURI of `tokenId`.
     *
     * Emits {MetadataUpdate}.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;

        emit MetadataUpdate(tokenId);
    }

    /**
     * @dev See {ERC721-_burn}. This override additionally checks to see if a
     * token-specific URI was set for the token, and if so, it deletes the token URI from
     * the storage mapping.
     */
    function _burn(uint256 tokenId) internal virtual override {
        super._burn(tokenId);

        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }

}