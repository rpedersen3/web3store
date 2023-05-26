pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import "./IERC721CollectionMetadata.sol";
import "./ERC721CollectionMetadata.sol";
import "./IERC721ProductExtension.sol";
import "./IERC6059.sol";
import "./ERC6059.sol";

abstract contract ERC721ProductExtension is Ownable, ERC6059, ERC721CollectionMetadata, ERC721URIStorage, IERC721ProductExtension {
    bytes4 private constant _INTERFACE_ID_ERC721ProductExtension = 0xbcc08bd2;

    function ownerOf(
        uint256 tokenId
    ) public view virtual override (ERC6059, ERC721)   returns (address) {
        return super.ownerOf(tokenId);
    }

    function _approve(address to, uint256 tokenId) internal override(ERC721, ERC6059) {
        super._approve(to, tokenId);
    }

    function _exists(uint256 tokenId) internal view override(ERC721, ERC6059) returns (bool) {
        return super._exists(tokenId);
    }
    function _isApprovedOrOwner(
        address spender,
        uint256 tokenId
    ) internal view override (ERC721, ERC6059) returns (bool) {
        return super._isApprovedOrOwner(spender, tokenId);
    }

    function _requireMinted(uint256 tokenId) internal view virtual 
        override (ERC721, ERC6059)  {
            super._requireMinted(tokenId);
    }

    function _mint(address to, uint256 tokenId) internal virtual
        override (ERC721, ERC6059)  {
            super._mint(to, tokenId);
    }

    
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal virtual 
        override (ERC721, ERC6059) {
        super._safeTransfer(from, to, tokenId, data);
    }

    function _safeMint(address to, uint256 tokenId) internal virtual 
        override (ERC721, ERC6059)  {
        super._safeMint(to, tokenId);
    }

    function _safeMint(
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal virtual 
    override (ERC721, ERC6059)  {
        super._safeMint(to, tokenId, data);
    }


    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override (ERC721, ERC6059) {
        super._transfer(from, to, tokenId);
    }

/*
    function transferChild(
        uint256 tokenId,
        address to,
        uint256 destinationId,
        uint256 childIndex,
        address childAddress,
        uint256 childId,
        bool isPending,
        bytes memory data
    ) public virtual  override (IERC6059, ERC6059)  {
        super.transferChild(tokenId, to, destinationId, childIndex, childAddress, childId, isPending, data);
    }
*/


    function balanceOf(address owner) public view virtual 
        override (ERC721, ERC6059) returns (uint256) 
    {
        return super.balanceOf(owner);
    }

    function approve(address to, uint256 tokenId) public virtual 
        override (ERC721, ERC6059) {
            super.approve(to, tokenId);
    }

    function isApprovedForAll(
        address owner,
        address operator
    ) public view virtual override (ERC721, ERC6059)  returns (bool) {
        return super.isApprovedForAll(owner, operator);
    }

    function getApproved(
        uint256 tokenId
    ) public view virtual override (ERC721, ERC6059) returns (address) {
        return super.getApproved(tokenId);
    }

    
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public virtual override (ERC6059, ERC721)  {
        super.safeTransferFrom(from, to, tokenId, data);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual  override (ERC6059, ERC721)  {
        super.safeTransferFrom(from, to, tokenId);
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override (ERC721, ERC6059)  {
        super.transferFrom(from, to, tokenId);
    }

    function setApprovalForAll(address operator, bool approved) public virtual 
        override (ERC721, ERC6059) {
            super.setApprovalForAll(operator, approved);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, ERC6059) returns (bool) {
        return
                interfaceId == 0x80ac58cd || 
                interfaceId == type(ERC165).interfaceId ||
                interfaceId == type(ERC721ProductExtension).interfaceId ||
                interfaceId == type(IERC6059).interfaceId;
    } 

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }
}