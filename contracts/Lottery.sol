pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    constructor() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }

    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public {
        require(msg.sender == manager);
        uint index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }
}


/* pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    constructor() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
} */


/* pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    uint[] public players;

    constructor() public {
        manager = msg.sender;
    }
} */

/* pragma solidity ^0.4.17;

contract Test {
    uint[] public myArray;

    constructor() public {
        myArray.push(10);
        myArray.push(20);
        myArray.push(30);
    }

    function getMyArray() public view returns (uint[]) {
        return myArray;
    }
} */

/* pragma solidity ^0.4.17;
pragma experimental ABIEncoderV2;

contract Inbox {
    string[] public message;

    constructor(string initialMessage) public {
        setMessage(initialMessage);
    }

    function setMessage(string newMessage) public {
        message.push(newMessage);
    }

    function getMessage() public view returns (string[]) {
        return message;
    }
} */

/* pragma solidity ^0.4.17;
pragma experimental ABIEncoderV2;

contract Inbox {
    string[] public message;

    constructor(string initialMessage) public {
        setMessage(initialMessage);
    }

    function setMessage(string newMessage) public {
        message.push(newMessage);
    }

    function getMessage() public view returns (string[]) {
        return message;
    }
} */
