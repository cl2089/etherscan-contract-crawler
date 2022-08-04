// SPDX-License-Identifier: CAL
pragma solidity =0.8.10;

/// @title OpAdd
/// @notice Opcode for adding N numbers.
library OpAdd {
    function add(uint256 operand_, uint256 stackTopLocation_)
        internal
        pure
        returns (uint256)
    {
        assembly {
            let location_ := sub(stackTopLocation_, mul(operand_, 0x20))
            let accumulator_ := mload(location_)
            let intermediate_
            for {
                let cursor_ := add(location_, 0x20)
            } lt(cursor_, stackTopLocation_) {
                cursor_ := add(cursor_, 0x20)
            } {
                intermediate_ := add(accumulator_, mload(cursor_))
                // Adapted from Open Zeppelin safe math.
                if lt(intermediate_, accumulator_) {
                    revert(0, 0)
                }
                accumulator_ := intermediate_
            }
            mstore(location_, accumulator_)
            stackTopLocation_ := add(location_, 0x20)
        }

        return stackTopLocation_;
    }
}