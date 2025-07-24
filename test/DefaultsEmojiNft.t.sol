// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DefaultUriMinterScript} from "../script/DefaultUriMinter.s.sol";
import {EmojiNft} from "../src/EmojiNft.sol";

contract DefaultsEmojiNft is Test {
    DefaultUriMinterScript public defaultUriMinterScript;

    string public constant EXAMPLE_TOKEN_URI =
        "ewogICAgImRlc2NyaXB0aW9uIjogIkV4YW1wbGUiLAogICAgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsQUJDMTIzIiwKICAgICJuYW1lIjogIk5vIG5hbWUiLAogICAgImF0dHJpYnV0ZXMiOiBbXQp9";

    function setUp() public {
        defaultUriMinterScript = new DefaultUriMinterScript();
    }

    function testJsonToTokenURI() public view {
        string memory loadedJson = vm.readFile("./test/metadata/example.json");

        string memory encodeUri = defaultUriMinterScript.jsonToTokenURI(loadedJson);

        assert(keccak256(abi.encodePacked(EXAMPLE_TOKEN_URI)) == keccak256(abi.encodePacked(encodeUri)));
    }
}
