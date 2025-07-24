// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {EmojiNftScript} from "../script/EmojiNft.s.sol";
import {EmojiNft} from "../src/EmojiNft.sol";

contract EmojiNftTest is Test {
    EmojiNftScript public deployer;
    EmojiNft public emojiNft;

    string constant NFT_NAME = "Emoji";
    string constant NFT_SYMBOL = "EMJ";

    string public constant EXAMPLE_TOKEN_URI =
        "ewogICAgImRlc2NyaXB0aW9uIjogIkV4YW1wbGUiLAogICAgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsQUJDMTIzIiwKICAgICJuYW1lIjogIk5vIG5hbWUiLAogICAgImF0dHJpYnV0ZXMiOiBbXQp9";
    address constant USER = address(1);

    string constant EXPECTED_BASE_URI = "data:application/json;base64,";

    function setUp() public {
        deployer = new EmojiNftScript();
        emojiNft = deployer.run();
    }

    function testInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(NFT_NAME)) ==
                keccak256(abi.encodePacked(emojiNft.name()))
        );
        assert(
            keccak256(abi.encodePacked(NFT_SYMBOL)) ==
                keccak256(abi.encodePacked(emojiNft.symbol()))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        emojiNft.mintNft(EXAMPLE_TOKEN_URI);

        assert(emojiNft.balanceOf(USER) == 1);
    }

    function testTokenURIIsCorrect() public {
        vm.prank(USER);
        emojiNft.mintNft(EXAMPLE_TOKEN_URI);

        assert(
            keccak256(abi.encodePacked(emojiNft.tokenURI(0))) ==
                keccak256(
                    abi.encodePacked(EXPECTED_BASE_URI, EXAMPLE_TOKEN_URI)
                )
        );
    }

    function testJsonToTokenURI() public view {
        string memory loadedJson = vm.readFile("./test/metadata/example.json");

        console.log(loadedJson);

        string memory encodeUri = deployer.jsonToTokenURI(loadedJson);

        assert(
            keccak256(abi.encodePacked(EXAMPLE_TOKEN_URI)) ==
                keccak256(abi.encodePacked(encodeUri))
        );
    }
}
