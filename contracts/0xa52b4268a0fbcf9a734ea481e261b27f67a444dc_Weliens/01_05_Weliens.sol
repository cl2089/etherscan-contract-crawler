// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Warrior aliens
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                             //
//                                                                                                                             //
//                                                                                                                             //
//     ______     __    __     ______     ______        ______     ______     ______     __  __     ______     _____           //
//    /\  __ \   /\ "-./  \   /\  __ \   /\  == \      /\  == \   /\  __ \   /\  ___\   /\ \_\ \   /\  ___\   /\  __-.         //
//    \ \ \/\ \  \ \ \-./\ \  \ \  __ \  \ \  __<      \ \  __<   \ \  __ \  \ \___  \  \ \  __ \  \ \  __\   \ \ \/\ \        //
//     \ \_____\  \ \_\ \ \_\  \ \_\ \_\  \ \_\ \_\     \ \_\ \_\  \ \_\ \_\  \/\_____\  \ \_\ \_\  \ \_____\  \ \____-        //
//      \/_____/   \/_/  \/_/   \/_/\/_/   \/_/ /_/      \/_/ /_/   \/_/\/_/   \/_____/   \/_/\/_/   \/_____/   \/____/        //
//                                                                                                                             //
//                                                                                                                             //
//                                                                                                                             //
//                                                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Weliens is ERC721Creator {
    constructor() ERC721Creator("Warrior aliens", "Weliens") {}
}