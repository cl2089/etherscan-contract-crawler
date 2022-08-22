// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: AarbozT Collection
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                 █████   █████  ██████  ██████   ██████  ███████ ████████               //
//                ██   ██ ██   ██ ██   ██ ██   ██ ██    ██    ███     ██                  //
//                ███████ ███████ ██████  ██████  ██    ██   ███      ██                  //
//                ██   ██ ██   ██ ██   ██ ██   ██ ██    ██  ███       ██                  //
//                ██   ██ ██   ██ ██   ██ ██████   ██████  ███████    ██                  //
//                                                                                        //
//                                                                                        //
//     ██████  ██████  ██      ██      ███████  ██████ ████████ ██  ██████  ███    ██     //
//    ██      ██    ██ ██      ██      ██      ██         ██    ██ ██    ██ ████   ██     //
//    ██      ██    ██ ██      ██      █████   ██         ██    ██ ██    ██ ██ ██  ██     //
//    ██      ██    ██ ██      ██      ██      ██         ██    ██ ██    ██ ██  ██ ██     //
//     ██████  ██████  ███████ ███████ ███████  ██████    ██    ██  ██████  ██   ████     //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract ABZTC is ERC721Creator {
    constructor() ERC721Creator("AarbozT Collection", "ABZTC") {}
}