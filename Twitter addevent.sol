// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract Twitter {

    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;

    }
    mapping (address => Tweet[]) public tweets;
    address public owner;

    // define the events here
    event Tweetcreated (uint256 id, address author, string content, uint256 timestamp);

    constructor()
}