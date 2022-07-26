// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: BASIRAT
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////
//                                                           //
//                                                           //
//                                                           //
//      ____           _____ _____ _____         _______     //
//     |  _ \   /\    / ____|_   _|  __ \     /\|__   __|    //
//     | |_) | /  \  | (___   | | | |__) |   /  \  | |       //
//     |  _ < / /\ \  \___ \  | | |  _  /   / /\ \ | |       //
//     | |_) / ____ \ ____) |_| |_| | \ \  / ____ \| |       //
//     |____/_/    \_\_____/|_____|_|  \_\/_/    \_\_|       //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
///////////////////////////////////////////////////////////////


contract ART is ERC721Creator {
    constructor() ERC721Creator("BASIRAT", "ART") {}
}