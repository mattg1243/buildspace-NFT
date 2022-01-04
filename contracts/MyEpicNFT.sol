// SPDX-License-Identifier: UNLICENSED
// Jakck the Shepsky metadata: https://jsonkeeper.com/b/DF96
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
    // keep track of token IDs with OpenZeppelin 
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    constructor() ERC721 ("SquareNFT", "SQUARE")  {
        console.log("Yo my contract is on the block(chain)");
    }

    // mint function
    function makeAnEpicNFT() public {
        // get the current token ID starting from 0
        uint256 newItemId = _tokenIds.current();
        // actually mint the NFT to the sender using msg.sender
        _safeMint(msg.sender, newItemId);
        // set the NFTs data
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/DF96");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
        // increment the counter for the IDs
        _tokenIds.increment();
    }
}