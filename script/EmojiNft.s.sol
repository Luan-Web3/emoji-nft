// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {EmojiNft} from "../src/EmojiNft.sol";

contract EmojiNftScript is Script {
    function run() external returns (EmojiNft) {
        vm.startBroadcast();
        EmojiNft emojiNft = new EmojiNft();
        vm.stopBroadcast();
        return emojiNft;
    }
}
