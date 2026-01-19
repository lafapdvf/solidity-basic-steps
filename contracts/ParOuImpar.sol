// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/Strings.sol";

contract ParOuImpar {

    string public choicePlayer1 = ""; // EVEN OR ODD
    address public player1;
    uint8 private numberPlayer1;
    string public status = "";

    function compare(string memory str1, string memory str2) private pure returns(bool) {
        bytes memory arrA = bytes(str1);
        bytes memory arrB = bytes(str2);
        return arrA.length == arrB.length && keccak256(arrA) == keccak256(arrB);
    }

    function choose(string memory newChoice) public {
        require(compare(newChoice, "EVEN") || compare(newChoice, "ODD"), "Choose EVEN or ODD");

        string memory message = string.concat("Player 1 has already chosen ", choicePlayer1);
        require(compare(choicePlayer1, ""), message);

        choicePlayer1 = newChoice;
        player1 = msg.sender;
        status = string.concat("Player 1 is ", Strings.toHexString(player1), " and chose ", choicePlayer1);
    }

    function play(uint8 number) public {
        require(!compare(choicePlayer1, ""), "First of all, choose your option (EVEN or ODD)");
        require(number > 0, "The number must be greater than 0.");

        if(msg.sender == player1) {
            numberPlayer1 = number;
            status = "Player 1 has already played. Waiting for player 2.";
        }
        else {
            require(numberPlayer1 != 0, "Player 1 has not played yet.");
            bool isEven = (numberPlayer1 + number) % 2 == 0;
            string memory message = string.concat("Player 1 chose ", choicePlayer1,
                " and played ", Strings.toString(numberPlayer1),
                ". Player 2 played ", Strings.toString(number), ".");

            if(isEven && compare(choicePlayer1, "EVEN"))
                status = string.concat(message, ". Player 1 won.");
            else if(!isEven && compare(choicePlayer1, "ODD")) 
                status = string.concat(message, ". Player 1 won.");
            else 
                status = string.concat(message, ". Player 2 won.");

            choicePlayer1 = "";
            numberPlayer1 = 0;
            player1 = address(0);
        }
    }
}