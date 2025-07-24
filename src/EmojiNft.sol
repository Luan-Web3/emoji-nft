// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract EmojiNft is ERC721 {
    error EmojiNft_TokenUriNotFound();

    mapping(uint256 tokenId => string tokenURI) private _tokenIdToUri;
    uint256 private _tokenCounter;

    constructor() ERC721("Emoji", "EMJ") {
        _tokenCounter = 0;
    }

    function mintNft(string memory tokenURI_) public {
        _tokenIdToUri[_tokenCounter] = tokenURI_;
        _safeMint(msg.sender, _tokenCounter);
        _tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert EmojiNft_TokenUriNotFound();
        }

        return string(abi.encodePacked(_baseURI(), _tokenIdToUri[tokenId]));
    }

    function getTokenCounter() public view returns (uint256) {
        return _tokenCounter;
    }
}
