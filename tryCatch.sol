// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyContract {
    // Events to log what happens
    event Success(string message);
    event ErrorCaught(string reason);
    event LowLevelError(bytes data);

    function myFunction() public {
        try this.revertFunction() {
            // This will never be hit, because revertFunction always reverts
            emit Success("Function executed successfully");
        } 
        catch Error(string memory errorMessage) {
            // Catches revert("...") and require("...") errors
            emit ErrorCaught(errorMessage);
        } 
        catch (bytes memory errorData) {
            // Catches low-level errors (e.g. assert, invalid opcodes)
            emit LowLevelError(errorData);
        }
    }

    function revertFunction() public pure {
        revert("Explicitly reverted!");
    }
}
