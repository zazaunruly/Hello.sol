// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

// 1.   create a twitter Contract 
// 2.   create a mapping between user and tweet
// 3.   Add function to create a tweet and save it in mapping
// 4.   Create a function to get Tweet

// 1.   add a function called changesTweetlength to change max tweet length 
//      HINT: use a newtweetLength as input for function
// 2.   create a constructor function to set an owner of contract
// 3.   create a modifier called onlyowner
// 4.   Use onlyowner on the changetweet Length function

// 1.   Add id to tweet Struct to make every tweet unique
// 2.   Set the id to be the Tweet length
// Hint:   You do it in the create Tweet function
// 3.   Add a function to like the tweet
// Hint: there should be 2 parameters, id and author
// 4.   Add a function to unlike the tweet 
// Hint: make sure you can unlike if likes count is greater tan 0
// 5.   Mark both functions external 

// 1.   create event for creating the tweet, called Tweetcreated
//      use parameters like id, author, content, timestamp
// 2.   Emit the event in the CreateTweet ( function below
// 3.   Create Event for liking the tweet. called Tweetliked
//      use parameters like liker, tweet Author, tweeetid, newlikecount
// 4.   Emikt the event in the like tweet () function below

// 1. Create a function, get Total likes, to get total likes, to get total Tweet likes for the user 
// Use parameters of author
// 2. loop over all the tweets
// 3. Sum up totalLikes
// 4. Return totalLikes

// 1. import Ownable.sol
// 2. Inherit Ownable contract
// 3. Replace current onlyOwner


contract Twitter is Ownable {

   // define a struct 

    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint timestamp;
        uint256 likes; 
    }

    mapping (address => Tweet[]) public tweets;
    

 
    event TweetCreated(uint256 id, address author, string content, uint256 timestamp); 
    event TweetLiked(address liker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);
    event TweetUnliked(address unliker, address tweetAuthor, uint256 tweetid, uint256 newLikeCount); 

    constructor () Ownable (msg.sender){
        
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function getTotalLikes(address _author) external view returns(uint){
        uint totalLikes;

        for(uint i = 0; i < tweets[_author].length; i++) {
            totalLikes += tweets[_author][i].likes;
        }

        return totalLikes;
    }


    function createTweet(string memory _tweet) public {
  
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long");  

        Tweet memory newTweet = Tweet({
            id: tweets [msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        }); 

        tweets[msg.sender].push(newTweet);

        emit TweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);
    }

    function likeTweet(address author, uint256 id) external{
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");

        tweets[author] [id].likes++;

        emit TweetLiked(msg.sender, author, id, tweets[author][id].likes);

    }   

    function unlikeTweet(address author, uint256 id) external{
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        require(tweets[author][id].likes > 0, "TWEET HAS NO LIKES");

        tweets[author][id].likes--;

        emit TweetUnliked(msg.sender, author, id, tweets[author][id].likes); 
    }

    
    
    function getTweet ( uint _i) public view returns (Tweet memory){
        return tweets [msg.sender] [_i];
    }
    
    function getAlltweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}

