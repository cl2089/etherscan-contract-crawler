// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Scanning The Scanner
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                           //
//                                                                                                                                           //
//        Bård Ionson                                                                                                                        //
//                                                                                                                                           //
//                                                                                                                                           //
//      _________                    .__                   __  .__                                                                           //
//     /   _____/ ____ _____    ____ |__| ____    ____   _/  |_|  |__   ____                                                                 //
//     \_____  \_/ ___\\__  \  /    \|  |/    \  / ___\  \   __\  |  \_/ __ \                                                                //
//     /        \  \___ / __ \|   |  \  |   |  \/ /_/  >  |  | |   Y  \  ___/                                                                //
//    /_______  /\___  >____  /___|  /__|___|  /\___  /   |__| |___|  /\___  >                                                               //
//            \/     \/     \/     \/        \//_____/              \/     \/                                                                //
//      _________                                                                                                                            //
//     /   _____/ ____ _____    ____   ____   ___________                                                                                    //
//     \_____  \_/ ___\\__  \  /    \ /    \_/ __ \_  __ \                                                                                   //
//     /        \  \___ / __ \|   |  \   |  \  ___/|  | \/                                                                                   //
//    /_______  /\___  >____  /___|  /___|  /\___  >__|                                                                                      //
//            \/     \/     \/     \/     \/     \/                                                                                          //
//                                                                                                                                           //
//                                                                                                                                           //
//                                                                                                                                           //
//                                                                                                                                           //
//                                                                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract SCAN is ERC721Creator {
    constructor() ERC721Creator("Scanning The Scanner", "SCAN") {}
}