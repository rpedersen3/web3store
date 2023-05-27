// SPDX-License-Identifier: CC0-1.0

pragma solidity >=0.8.0;

interface IERC721CollectionMetadata {


    // Logged when the collection URL is changed
    /// @notice Emitted when the collectionURL is changed
    /// The empty string for `collectionUri` indicates that there is no collection metadata
    event UpdateCollection(string collectionUri);

    /// @notice set the new collectionUri - remember the date it was set on
    /// Throws if `tokenId` is not valid NFT
    /// @param collectionUri  The new collection metadata
    function setCollectionUri(string memory collectionUri) external;

    /// @notice Get the collectionUri
    /// @return The collection uri 
    function getCollectionUri() external view returns (string memory);

    /// @notice Get the changes made to collectionUri
    /// @return The history of changes to `collectionUri`
    function getCollectionHistory() external view returns (string[] memory);
}