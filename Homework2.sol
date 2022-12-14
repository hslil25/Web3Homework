// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract toDoList{
    struct toDo{
        bool hasDone;
        string job;
    }
    //29357 gas to view this public data
    toDo[] public toDoArr;

    function create(string calldata text) external{
        toDoArr.push(toDo({
            job : text,
            hasDone:false
        }));
    }

    function updateToDo(uint index, string calldata newText) external {
        toDoArr[index].job = newText;
    }

    function getToDo(uint index) external view returns (string memory,bool){
        //29441 gas to use function
        toDo storage todo = toDoArr[index];
        return (todo.job,todo.hasDone);
    }

    function completed(uint index) external  {
        //46320 gas
        //toDoArr[index].hasDone = !toDoArr[index].hasDone;
        //26084 gas - as this is more gas efficient I am using this code
        toDoArr[index].hasDone = false;
    }
}
