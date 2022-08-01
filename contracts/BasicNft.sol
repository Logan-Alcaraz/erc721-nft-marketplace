// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; // imports ERC721 contract

contract BasicNft is ERC721 {
    string public constant TOKEN_URI =
        "ifps://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json"; // initializes token image
    uint256 private s_tokenCounter; // keeps track of how many tokens have been minted

    event DogMinted(uint256 indexed tokenId);

    constructor() ERC721("Dogie", "DOG") {
        // initializes token count to 0
        s_tokenCounter = 0;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter); // safely mints nft to function caller
        emit DogMinted(s_tokenCounter); // emits that an nft has been minted
        s_tokenCounter = s_tokenCounter + 1; // increases nft mint counter
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        require(
            _exists(tokenId), // returns that a token exists
            "ERC721Metadata: URI query for nonexistent token"
        );
        return TOKEN_URI; // returns the given token
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter; // returns amount of minted nfts
    }
}
