// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Blockchain {

    struct Block {
        uint256 blockNumber;
        uint256 timestamp;
        bytes32 previousHash;
        bytes32 hash;
        string data;
    }

    Block[] public chain;

    constructor() {
        createGenesisBlock();
    }

    function createGenesisBlock() internal {
        Block memory genesisBlock = Block({
            blockNumber: 0,
            timestamp: block.timestamp,
            previousHash: bytes32(0),
            hash: bytes32(0),
            data: "Genesis Block"
        });

        genesisBlock.hash = computeHash(genesisBlock);
        chain.push(genesisBlock);
    }

    function computeHash(Block memory blk) internal pure returns (bytes32) {
        return keccak256(
            abi.encodePacked(
                blk.blockNumber,
                blk.timestamp,
                blk.previousHash,
                blk.data
            )
        );
    }

    function getGenesisBlock() public view returns (Block memory) {
        return chain[0];
    }
}
