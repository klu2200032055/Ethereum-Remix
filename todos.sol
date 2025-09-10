// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string calldata _text) public {
        // 2 valid ways to initialize and push a struct:

        // 1. Calling it like a function
        todos.push(Todo(_text, false));

        // 2. Key-value mapping style
        todos.push(Todo({text: _text, completed: false}));

        // The 3rd way requires declaring memory first
        Todo memory todo;
        todo.text = _text;
        // todo.completed is automatically initialized to false
        todos.push(todo);
    }

    // Solidity automatically creates a getter for 'todos',
    // but here’s a custom getter for convenience
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // Update text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // Toggle completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
