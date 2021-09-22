// SPDX-License-Identifier: MIT
pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; //include in yaml

contract SimpleCollectible is ERC721 {
    uint256 public tokenCounter; // global (constructor, createCollectible)

    // name and symbol
    constructor() public ERC721("Dogie", "DOG") {
        tokenCounter = 0;
    }

    // create new nft and assign to whover called this function
    // mapping tokenID to new address/owner
    function createCollectible(string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 newTokenId = tokenCounter;
        // inherit function from openzeppelin: https://docs.openzeppelin.com/contracts/2.x/erc721
        _safeMint(msg.sender, newTokenId); // owner, unique tokenID
        _setTokenURI(newTokenId, tokenURI); // uri https: uniquely points to metadata file, immage associated to it that you can see
        tokenCounter = tokenCounter + 1;
        return newTokenId;
    }
}

// NOTES: safemint checks to see if tokenID has been used
