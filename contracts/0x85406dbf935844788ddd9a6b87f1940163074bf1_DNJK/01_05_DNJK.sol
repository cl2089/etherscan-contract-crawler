// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Diana Junakovic
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                                                                     //
//                                                                                     //
//                                                                                     //
//                                                                                     //
//                                                                                     //
//           _             _          _                   _             _              //
//          /\ \          /\ \       / /\                /\ \     _    / /\            //
//         /  \ \____     \ \ \     / /  \              /  \ \   /\_\ / /  \           //
//        / /\ \_____\    /\ \_\   / / /\ \            / /\ \ \_/ / // / /\ \          //
//       / / /\/___  /   / /\/_/  / / /\ \ \          / / /\ \___/ // / /\ \ \         //
//      / / /   / / /   / / /    / / /  \ \ \        / / /  \/____// / /  \ \ \        //
//     / / /   / / /   / / /    / / /___/ /\ \      / / /    / / // / /___/ /\ \       //
//    / / /   / / /   / / /    / / /_____/ /\ \    / / /    / / // / /_____/ /\ \      //
//    \ \ \__/ / /___/ / /__  / /_________/\ \ \  / / /    / / // /_________/\ \ \     //
//     \ \___\/ //\__\/_/___\/ / /_       __\ \_\/ / /    / / // / /_       __\ \_\    //
//      \/_____/ \/_________/\_\___\     /____/_/\/_/     \/_/ \_\___\     /____/_/    //
//                                                                                     //
//                                                                                     //
//                                                                                     //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////


contract DNJK is ERC721Creator {
    constructor() ERC721Creator("Diana Junakovic", "DNJK") {}
}