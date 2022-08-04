// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: 1/1s by Alex Kittoe
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
//                                                                                                              //
//     __       __ __            _                  ___   _                  _   __ _  _    _                   //
//    /  |     / //  |          | |                / _ \ | |                | | / /(_)| |  | |                  //
//    `| |    / / `| |  ___     | |__   _   _     / /_\ \| |  ___ __  __    | |/ /  _ | |_ | |_  ___    ___     //
//     | |   / /   | | / __|    | '_ \ | | | |    |  _  || | / _ \\ \/ /    |    \ | || __|| __|/ _ \  / _ \    //
//    _| |_ / /   _| |_\__ \    | |_) || |_| |    | | | || ||  __/ >  <     | |\  \| || |_ | |_| (_) ||  __/    //
//    \___//_/    \___/|___/    |_.__/  \__, |    \_| |_/|_| \___|/_/\_\    \_| \_/|_| \__| \__|\___/  \___|    //
//                                       __/ |                                                                  //
//                                      |___/                                                                   //
//                                                                                                              //
//                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Kittoe is ERC721Creator {
    constructor() ERC721Creator("1/1s by Alex Kittoe", "Kittoe") {}
}