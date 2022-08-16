// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: donkey-brAIned
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                              //
//                                                                                              //
//      ╔╗        ╔╗                ╔╗     ╔═══╗╔══╗          ╔╗                                //
//      ║║        ║║                ║║     ║╔═╗║╚╣╠╝          ║║                                //
//    ╔═╝║╔══╗╔═╗ ║║╔╗╔══╗╔╗ ╔╗     ║╚═╗╔═╗║║ ║║ ║║ ╔═╗ ╔══╗╔═╝║                                //
//    ║╔╗║║╔╗║║╔╗╗║╚╝╝║╔╗║║║ ║║╔═══╗║╔╗║║╔╝║╚═╝║ ║║ ║╔╗╗║╔╗║║╔╗║                                //
//    ║╚╝║║╚╝║║║║║║╔╗╗║║═╣║╚═╝║╚═══╝║╚╝║║║ ║╔═╗║╔╣╠╗║║║║║║═╣║╚╝║                                //
//    ╚══╝╚══╝╚╝╚╝╚╝╚╝╚══╝╚═╗╔╝     ╚══╝╚╝ ╚╝ ╚╝╚══╝╚╝╚╝╚══╝╚══╝                                //
//                        ╔═╝║                                                                  //
//                        ╚══╝  donkey-brained.eth + AI = ???                                   //
//                                                                                              //
//                                                                                              //
//                                                                                              //
//                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////


contract dbAI is ERC721Creator {
    constructor() ERC721Creator("donkey-brAIned", "dbAI") {}
}