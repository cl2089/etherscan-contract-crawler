// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Rare Pepe´s Art 1/1
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                               //
//                                                                                                                                               //
//    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                   //
//    //                                                                                                                    //                   //
//    //                                                                                                                    //                   //
//    //                                         .',,;;;;,'.                                                                //                   //
//    //                                     .,;;;,,''.'',;:::;'           ..',,,'..                                        //                   //
//    //                                   ':;'.            .':cl;.   .,;;,,,,''',;;:;'.                                    //                   //
//    //                                .,:,.                   .coc;,,..            .;c:.                                  //                   //
//    //                               ,:'                        .do.                  ,l;                                 //                   //
//    //                             .:,.         .',;;;;;;;;,'..  .::.                  .lc                                //                   //
//    //                            ':.       .,;;;,'.......',;;::;'.,'  ...'',,;,,''..   .l;                               //                   //
//    //                           ,;.      .,;'.                 .'';oo:;;;;;;;;;;;;;,,''':c;;;'.                          //                   //
//    //                          ';.       ..             ..',,,,,,,,:od:.               .   .,:c;.                        //                   //
//    //                         .;.                  .';;;;;;;;;,,,,,,';lo;     ..',;;;;;;:;;;,,,cl;.                      //                   //
//    //                      ..,c'               .',;::c:;,,,;;;;;;,,'...cOo,,;:loddddddooddooollccodl.                    //                   //
//    //                    ',,':;             .':ldl;,,;ccclooddddocccc:;:oxl,,,,,:coxkO00KK0kooool:,lc.                   //                   //
//    //                  'c;.  ,.          .':lc:;;lolcdK0xKMMMMMW0:..',,;co:..',;;cOKOXMMMMWO,..';::cdo.                  //                   //
//    //                .:l'   .'.         ;oc;.  .ll,. cNWNWMMMMMMNl       ,xl,'.  .kNXWMMMMMWo      .:x:                  //                   //
//    //               .l:.                .',;;;:xd.   ;KMMMMMMMMMNc       .dl     .dWMMMMMMMMx.      .o:                  //                   //
//    //              .l;                        .,ll:'..oNMMMMMMMNd.      .:kl..    'kNMMMMMWO,   ..'cl,                   //                   //
//    //             .l;                           .,:ccclOKXNNNWNOocccccclx0d,''''''':dO0K0Oxc,,,,:llc.                    //                   //
//    //            .cc                            .,,;::cccc::::;;;;,,'';cl:.      ....'''....   .''.                      //                   //
//    //            ,l.                                .',;::::::::cloc,,,'.               ...',;;'                         //                   //
//    //           .c;                                          .,::;'.        .,;coocccccc:;ckx,                           //                   //
//    //           .:.                                      .,;;;;'               .:ddc'.     .cc.                          //                   //
//    //           ;:                                       ....                     .;,.      .:l.                         //                   //
//    //           :,                                                                            co.                        //                   //
//    //          .:,                                                                            .lc                        //                   //
//    //          .:,                          ...''......                                        ,l,                       //                   //
//    //           :,                       .,;,,,,,'''',,,;;;;;:::;;,'....                ..'',,',;:;.                     //                   //
//    //           :;                      .:,    .....        ....',;;::::::;;,,,''',,,,;;,,,'..   :l.                     //                   //
//    //           ':.                    .;.   .',,,;;;;;;;;;;,'..            ........          .'::.                      //                   //
//    //           .:,                 .  .,,...........   ...',;;;;;;;;,,''........'',,,,,,;;;;,:c.                        //                   //
//    //            .:'                ;c.  ..',,;;;;:::::cc:::;,.......',,,,;;;;;;,,,,'''''..  .;,                         //                   //
//    //             .;'                ':;.              ...,,;::cccc::;'...         ....',;:;;;,.                         //                   //
//    //              'll'..              ..                         ..,;:::::::::::::;;cool;,..                            //                   //
//    //          .,;,,,;:c;,,,'..                                                   ...'.                                  //                   //
//    //        .:;'.    ..,,;;;,,,,,;,,,'....                       .....''',,,,;:c:,'.                                    //                   //
//    //       ;l'           .,,,,,,,,,,:looddddoolccc:::;::;;;;;;;;;;;;;;,,;cool:;..                                       //                   //
//    //      :c.                ..',,,,,,,;;;;;;:::::::::;;,,'''''.......',;:loc'                                          //                   //
//    //     :l.                         ..',,,,,,,,,,,,,;;;;;;;;,,,,'''''..   .,ll,  ERC-721                            //                      //
//    //                                            //                                                                                           //
//    //    RARE PEPE`S ART                                                                                                                //    //
//    //    by AlFa & TRT tokens                                                                                            //                   //
//    //                                                                                                                    //                   //
//    //                                                                                                                    //                   //
//    //                                                                                                                    //                   //
//    //                                                                                                                    //                   //
//    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                   //
//                                                                                                                                               //
//                                                                                                                                               //
//                                                                                                                                               //
//                                                                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract RPA721 is ERC721Creator {
    constructor() ERC721Creator(unicode"Rare Pepe´s Art 1/1", "RPA721") {}
}