// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: O R I G I N S
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////
//                                       //
//                                       //
//                                       //
//     (                          )      //
//     )\ )    (      (    (   ( /(      //
//    (()/(    )(    ))\  ))\  )\())     //
//     /(_))_ (()\  /((_)/((_)((_)\      //
//    (_)) __| ((_)(_)) (_))  | |(_)     //
//      | (_ || '_|/ -_)/ -_) | / /      //
//       \___||_|  \___|\___| |_\_\      //
//                                       //
//                                       //
///////////////////////////////////////////


contract GREEK is ERC721Creator {
    constructor() ERC721Creator("O R I G I N S", "GREEK") {}
}