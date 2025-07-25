// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {EmojiNft} from "../src/EmojiNft.sol";
import {EmojiNftScript} from "../script/EmojiNft.s.sol";

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DefaultUriMinterScript is Script {
    EmojiNft emojiNft;

    function run() external returns (EmojiNft) {
        address mostRecentlyDeployedEmojiNft = DevOpsTools.get_most_recent_deployment("EmojiNft", block.chainid);

        emojiNft = EmojiNft(mostRecentlyDeployedEmojiNft);

        string[] memory tokenURIs = new string[](6);
        tokenURIs[0] = jsonToTokenURI(vm.readFile("./metadata/devil.json"));
        tokenURIs[1] = jsonToTokenURI(vm.readFile("./metadata/in-love.json"));
        tokenURIs[2] = jsonToTokenURI(vm.readFile("./metadata/poker-face.json"));
        tokenURIs[3] = jsonToTokenURI(vm.readFile("./metadata/stupid.json"));
        tokenURIs[4] = jsonToTokenURI(vm.readFile("./metadata/vomiting.json"));
        tokenURIs[5] = jsonToTokenURI(vm.readFile("./metadata/zombie.json"));

        vm.startBroadcast();
        mintNftOnContract(tokenURIs[0]);
        mintNftOnContract(tokenURIs[1]);
        mintNftOnContract(tokenURIs[2]);
        mintNftOnContract(tokenURIs[3]);
        mintNftOnContract(tokenURIs[4]);
        mintNftOnContract(tokenURIs[5]);
        vm.stopBroadcast();

        return emojiNft;
    }

    function mintNftOnContract(string memory tokenURI_) public {
        emojiNft.mintNft(tokenURI_);
    }

    function jsonToTokenURI(string memory json_) public pure returns (string memory) {
        string memory jsonBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(json_))));

        return string(abi.encodePacked(jsonBase64Encoded));
    }
}
