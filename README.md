Emoji NFT
===========================

![GitHub repo size](https://img.shields.io/github/repo-size/Luan-Web3/emoji-nft?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/Luan-Web3/emoji-nft?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/Luan-Web3/emoji-nft?style=for-the-badge)

This project consists of an ERC721 contract whose tokens are 100% on-chain, as their images are generated directly as SVGs. This ensures complete decentralization and permanence of digital assets.

[Testnet Contract](https://sepolia.etherscan.io/token/0x856A2887AA45c4FF3f89E8aEb9afAE81D7516aD9)

<br/>
<p align="center">
<img src="./images/devil.svg" width="225" alt="Emoji NFT Devil">
<img src="./images/in-love.svg" width="225" alt="Emoji NFT In-Love">
<img src="./images/poker-face.svg" width="225" alt="Emoji NFT Poker-Face">
</p>
<p align="center">
<img src="./images/stupid.svg" width="225" alt="Emoji NFT Stupid">
<img src="./images/vomiting.svg" width="225" alt="Emoji NFT Vomiting">
<img src="./images/zombie.svg" width="225" alt="Emoji NFT Zombie">
</p>
<br/>

## Libraries Used

- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [FoundryDevOps](https://github.com/Cyfrin/foundry-devops)


## Requirements

Before you begin, make sure you meet the following requirements:

- [Foundry](https://getfoundry.sh/introduction/getting-started)

## Quickstart

```shell
git clone https://github.com/Luan-Web3/emoji-nft.git
cd emoji-nft
forge install
forge build
```
- Duplicate the `.env.example` file and rename it to `.env`

## Deploy the contract locally

Terminal A
```shell
anvil -b 5
```

Terminal B
```shell
source .env
forge script script/EmojiNft.s.sol:EmojiNftScript --private-key $PRIVATE_KEY --rpc-url <YOUR_RPC_URL> --broadcast
```

You can also run the script by minting the default tokens for your wallet.
```shell
forge script script/DefaultUriMinter.s.sol:DefaultUriMinterScript --private-key $PRIVATE_KEY --rpc-url <YOUR_RPC_URL> --broadcast
```

## License

<sup>
Licensed under either of <a href="LICENSE-APACHE">Apache License, Version
2.0</a> or <a href="LICENSE-MIT">MIT license</a> at your option.
</sup>

<br>

<sub>
Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in this crate by you, as defined in the Apache-2.0 license, shall
be dual licensed as above, without any additional terms or conditions.
</sub>
