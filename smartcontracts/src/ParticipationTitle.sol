// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract ParticipationTitle is ERC721 {

    constructor() ERC721("ParticipationTitle", "FPT") {}

    struct NFT {
        string name;
        string metadataURI;
    }

    NFT[] public nfts;

    function createNFT(address to, string memory name, string memory metadataURI) external {
        uint256 tokenId = nfts.length;
        nfts.push(NFT(name, metadataURI));
        _mint(to, tokenId);
    }

    function getNFT(uint256 tokenId) external view returns (string memory name, string memory metadataURI) {
        require(tokenId < nfts.length, "NFT does not exist");
        NFT memory nft = nfts[tokenId];
        return (nft.name, nft.metadataURI);
    }
}