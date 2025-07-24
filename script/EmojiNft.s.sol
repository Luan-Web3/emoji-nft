// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {EmojiNft} from "../src/EmojiNft.sol";

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract EmojiNftScript is Script {
    function run() external returns (EmojiNft) {
        vm.startBroadcast();
        EmojiNft emojiNft = new EmojiNft();
        vm.stopBroadcast();
        return emojiNft;
    }

    function jsonToTokenURI(
        string memory json
    ) public pure returns (string memory) {
        string memory jsonBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(json)))
        );

        return string(abi.encodePacked(jsonBase64Encoded));
    }
}
