// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Jose's Commissions
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                            ▄▄█████████▄                                                    //
//                                          ▄███████████████                                                  //
//                                         ██████████████████▄                                                //
//                                        ████████████████████                                                //
//                                        ████████████████████▌          █                                    //
//                                        ████████████████████            █▄ ▄▄                               //
//                                         ▀█████████████████             ▐████▄                              //
//                             ▐▌            ██████████████▀               ▐▓███▓▄                            //
//                         ▄   █               ▀▀▀████▀▀▀                 ▄ ▒▐████▌                           //
//                         ████▀                                          █▄ ▐████                            //
//                        ▄███▌                                          ██▒▄████                             //
//                       ███▌▀                                █▌        ▓▀▒████▌                              //
//                       ████▄  █▌       ▄         ▄▄ ▄▄     ██        ▀ ▄▄███▌                               //
//                        █████▄██▄      █▌      ▓▓██▓██▓▒▄███▀       ░███▓▓▓▓██▀                             //
//                          ████▌         ██▄▄  ▒▓█████████▓▒░░▄▄  ▄▄▄█░░ ▀▀▀▀ ▄▄                             //
//                            ██████▄       ▀▀▀▒██████████████████▄ ▒▓▒░░░      ▒███           ▄              //
//                          ▀████▒▓██▓▄▄▄▄ ▄▒▄███████████████▀██▀███░▓░▄▒        ░███▄         ▒█▄            //
//                                ▀▀▒▒▒▓▒▀█▓███████████████████▄ ▐███ ▒           █▓█▌         ███            //
//                  ▀▌                ▒░▒▐███▌██████████████████▌ ▀███ ▄█▌       █░▓▓▒░       ███▀            //
//                  ▐█                  ▓▓█▀▀▓████████████▓▀▀▒▒▀▀  ████▒█       ▓░▓██▒▒▄▄ ▄▄█▀▒█▀   ▐█        //
//             ▄     ██                ▄▄ ▓░ ▓█▓▓▒▒▀██████ ░████░  ▐████▒▄░▒  ░▓▒▓▓▓▀▄░▒▓▓▓▒▄▓▒     ██▌       //
//             █     ▀███▄      ▓░▒░   ▒▒░▓░ ▒ ████▌ █████ ▐▀████▓  ████ ▓▄ ▒▒▒ ░▒▒▀▀███████▄▄   ▄▄███        //
//             ▐█      ▀▓▒▀▀▀▀▀   ░░  ░  ░█░ ▓██████▓█████████████  ███▒▓▒▓▄ ░▒▒▓▓▓▒▓▄▄▄▒▒░▒▒███████▀         //
//              ██▄      ▀░░     ░▒▒░░░  ▐█▒  ████████▓██▓▀█████▓░ ▐██▒██▌ ▓▄   ░▀██▒▓███▒████████            //
//               ███▄       ░░░▒▒▒▒░░    ██▌░  ███████▒▒▒▄▓███▓▒   ▓▒▒░▒██▄ ▓█     ▒▀▀███████▀▀               //
//                 ███▒▒▒▒▒▒▒▓▒▒░▒░    ░███▌▒   ▀████████▀▀▀░░░   ▐▒▒▄██▓▓█▌ ▀█      ▀▀▀                      //
//                   ▀▀▒▀▀▒▀▀▀▀░ ▄▄▓▒░ ▐███▓▒░    ▒▓██▓██▀▀      ▒░████▓█▓█▌   ▀▄                             //
//                           ▄▄▓██▓▒▒  ████▌▒░      ░▀▓██▓░     ▄██████████   ▒▄░▓▄                           //
//                     ▄▄████████▓▒   █████▒▒▌                 ▓█████████▀   ░▒▓▓█▒▓█▄▄                       //
//                ▄▄██████████▓▀▒    █████▓▒▓                 ▓█████████░░    ░▓▓████▓███▓▄▄▄                 //
//            ▄████████▓▒▒▒▒░░░     █████▓▓█                 ▓████████░░   ░░▒░░░▀█████▄▀▀▓▓▓▓▓█▄             //
//          ▄████▀▒▒▒▒░░░░░░░      █████▓▓█                 █████████░░   ░░ ▒░▒▒▒░▀████▌  ▀██▒▓███▄          //
//        ▄███▒▒▒░░░░░░░          ████████                 ▐█████████░░      ▒██▒░▒▒░████▌  ███▓█████         //
//       ▄██▓▒░░░               ▄████████  ░░ ░░░   ░░   ░░███████▓▒██▓▄   ▄▓███ ░▒▒▒▒▒█▓▓▒ ███▓██████        //
//      ▐█▓▓▒░░                ▄███████▀  ░░░░░▒   ░░░▒▒▒▒░ ███████████████████▀ ░░▒▒▒▓▒▓▒░▐███████████       //
//      ▐██▌░░                ████████   ░▒░▒▒▒  ░░░░░▒░▒▒░░ ▀████████████████▒▒ ░░▒▒▒▒▒▒▒▒▓███████████       //
//      ▐█▌▒░               ▄███████  ░░░▒░░▒    ░░▒░░    ░░░░░ ▀█▀██████▀▓▀▒▓▓   ░▒▒▒▒▒░▓█████████████▒▄     //
//                                                                                                            //
//       ▀█▓▒▒░           ▄███████  ░░░▒▒░░▒   ▒▄▓▓▓▒▄▄▒▒    ░░░░ ▓▓█▓▓▓▓▓▓▓░      ░░░▓▓██████████████▌▒▓▓    //
//          ░           ▄███████  ▒▒▒▒▒▒░░  ▒▒▓▓▓▓███▓▒▄▒▒░    ▒▒░░ ▀▀▀▀▀        ▄▒▒▓████████████████▀▒▓▓█    //
//                   ▄███████▀  ▓▓▓▒▓▓▒░  ▒▓▓▒███▓▒▒▀██▓▓▒▒    ▒▒▒▒░          ▄████████▀▀▀▀▀▀▀▀▀▀▀▀ ▄▓████    //
//               ▄▄██████▀▀  ▄███▓▓█▓▒░ ░▒████████▓▓▓▒▒▒▒░░░  ░▒▓▓▓▒░    ░░ ▒███▀▀             ▄▄▄▓███████    //
//    ▄▄▄▄▄▄▄█████████▀    ▄████████▓▒ ▒▒████████████▓▓▓▓▒░   ▒▓▓▓▓▒▒    ▒▒██▓         ░░░▒▒▒▒████████████    //
//    ████████▀▓▒▒▒     ▄▓██████████▒  ▒▓███████████████▓▒▒░  ▒▓▒▒▒▒▒░   ▐██▌          ▒▒▒▒▒▒▓████████████    //
//                    ▄████████████▓░  ▒▓██████████████▒█▓░  ░░▓█▄░░     ▓██░     ▄██▄▄░▒▓▓▓▓█████████████    //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract JC is ERC721Creator {
    constructor() ERC721Creator("Jose's Commissions", "JC") {}
}