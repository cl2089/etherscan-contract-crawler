// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: FAN STUFF
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
//                                                                                                              //
//          ___       ___          ___                   ___                   ___          ___       ___       //
//         /  /\     /  /\        /__/\                 /  /\         ___     /__/\        /  /\     /  /\      //
//        /  /:/_   /  /::\       \  \:\               /  /:/_       /  /\    \  \:\      /  /:/_   /  /:/_     //
//       /  /:/ /\ /  /:/\:\       \  \:\             /  /:/ /\     /  /:/     \  \:\    /  /:/ /\ /  /:/ /\    //
//      /  /:/ /://  /:/~/::\  _____\__\:\           /  /:/ /::\   /  /:/  ___  \  \:\  /  /:/ /://  /:/ /:/    //
//     /__/:/ /://__/:/ /:/\:\/__/::::::::\         /__/:/ /:/\:\ /  /::\ /__/\  \__\:\/__/:/ /://__/:/ /:/     //
//     \  \:\/:/ \  \:\/:/__\/\  \:\~~\~~\/         \  \:\/:/~/://__/:/\:\\  \:\ /  /:/\  \:\/:/ \  \:\/:/      //
//      \  \::/   \  \::/      \  \:\  ~~~           \  \::/ /:/ \__\/  \:\\  \:\  /:/  \  \::/   \  \::/       //
//       \  \:\    \  \:\       \  \:\                \__\/ /:/       \  \:\\  \:\/:/    \  \:\    \  \:\       //
//        \  \:\    \  \:\       \  \:\                 /__/:/         \__\/ \  \::/      \  \:\    \  \:\      //
//         \__\/     \__\/        \__\/                 \__\/                 \__\/        \__\/     \__\/      //
//                                                                                                              //
//                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract FNST is ERC721Creator {
    constructor() ERC721Creator("FAN STUFF", "FNST") {}
}