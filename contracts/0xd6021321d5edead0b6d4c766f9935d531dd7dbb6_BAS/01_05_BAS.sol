// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Bastien Airdrop Services
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

///////////////////////////////////////////////////////////
//                                                       //
//                                                       //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶`¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶`¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶↑`¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶``¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶↑``¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶```¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶```¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶````¶`§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶````¶§↓¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶`````¶¶`7¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶7````↑¶¶4↑¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶`````↑¶¶¶↑`¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶``````↓¶¶¶¶``¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶````````¶¶¶¶§`§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§````````¶¶¶¶¶↓`¶¶¶§¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶`````````¶¶¶¶¶¶``¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶`````````↑¶¶¶¶¶¶¶``¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶``````````↓¶¶¶¶¶¶¶¶`§¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶§¶¶¶¶§¶```````````↑¶¶¶¶¶¶¶¶7`¶¶¶§¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶§¶````````````↓¶¶¶¶¶¶¶¶¶``¶¶§¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶↓````````````↓¶¶¶¶¶¶¶¶§¶``¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶`````````````7¶¶¶¶¶¶¶§¶§¶``¶§¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶``````````````↑§¶¶¶¶¶¶¶§¶¶§``¶§¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶```````````````7§¶¶¶¶¶¶¶§¶§¶``7¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶````````````````7§THIS IS YOUR``¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶`````````````````7AIRDROP¶¶¶¶¶¶¶``¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶4`````````````````↓¶¶¶¶¶¶¶¶¶¶¶¶§§4``¶¶¶¶¶¶    //
//    ¶¶¶¶¶``````````````````↓§¶¶¶¶¶¶¶¶¶¶¶§¶¶↓`7¶¶¶¶¶    //
//    ¶¶¶¶```````````````````7¶¶¶¶¶¶¶¶¶¶¶¶§¶¶§``§¶¶¶¶    //
//    ¶¶¶¶```````````````````↓§¶¶¶¶¶¶¶¶¶¶¶¶¶¶§¶``¶¶¶¶    //
//    ¶¶¶````````````````````↓§¶¶¶¶¶¶¶¶¶¶¶¶¶§¶§``↑¶¶¶    //
//    ¶¶¶````````````````````7§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§§``¶¶¶    //
//    ¶¶`````````````````````§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§¶``7¶¶    //
//    ¶¶````````````````````↑§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§7↑``¶¶    //
//    ¶¶````````````````````44¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶4§↓``¶¶    //
//    ¶¶``````````````````↑74§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§¶```¶¶    //
//    ¶¶`````````````````↑4§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§§↑↑```¶¶    //
//    ¶¶``````↑````````7§§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§44`````¶¶    //
//    ¶¶¶``````477474§§§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶7``````¶¶¶    //
//    ¶¶¶```````7¶§§§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶↓```````¶¶¶    //
//    ¶§¶¶``````↑↓§§§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶4````````¶¶¶¶    //
//    ¶¶¶¶¶``````↑444§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§§```````7¶¶¶§¶    //
//    ¶¶¶¶¶¶¶```````↓4§¶¶¶§§¶¶¶¶¶¶¶¶§§↑```````¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶`````````↑7474§¶¶¶¶¶§§``````↓¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶§¶¶§¶¶¶¶↓`````````````````````7¶¶¶¶§¶¶¶¶¶¶¶    //
//    ¶¶¶¶§¶¶¶¶¶¶¶¶¶¶¶¶§4↓````````74¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶    //
//                                                       //
//                                                       //
///////////////////////////////////////////////////////////


contract BAS is ERC1155Creator {
    constructor() ERC1155Creator() {}
}