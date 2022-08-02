// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: shoartsho
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                               //
//                                                                                                               //
//       .-'''-..---.  .---.    ,-----.      ____   .-------.,---------.  .-'''-..---.  .---.    ,-----.         //
//      / _     |   |  |_ _|  .'  .-,  '.  .'  __ `.|  _ _   \          \/ _     |   |  |_ _|  .'  .-,  '.       //
//     (`' )/`--|   |  ( ' ) / ,-.|  \ _ \/   '  \  | ( ' )  |`--.  ,---(`' )/`--|   |  ( ' ) / ,-.|  \ _ \      //
//    (_ o _).  |   '-(_{;}_;  \  '_ /  | |___|  /  |(_ o _) /   |   \ (_ o _).  |   '-(_{;}_;  \  '_ /  | :     //
//     (_,_). '.|      (_,_)|  _`,/ \ _/  |  _.-`   | (_,_).' __ :_ _:  (_,_). '.|      (_,_)|  _`,/ \ _/  |     //
//    .---.  \  | _ _--.   |: (  '\_/ \   .'   _    |  |\ \  |  |(_I_) .---.  \  | _ _--.   |: (  '\_/ \   ;     //
//    \    `-'  |( ' ) |   | \ `"/  \  ) /|  _( )_  |  | \ `'   (_(=)_)\    `-'  |( ' ) |   | \ `"/  \  ) /      //
//     \       /(_{;}_)|   |  '. \_/``".' \ (_ o _) |  |  \    / (_I_)  \       /(_{;}_)|   |  '. \_/``".'       //
//      `-...-' '(_,_) '---'    '-----'    '.(_,_).'''-'   `'-'  '---'   `-...-' '(_,_) '---'    '-----'         //
//                                                                                                               //
//                                                                                                               //
//                                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract SHINK is ERC721Creator {
    constructor() ERC721Creator("shoartsho", "SHINK") {}
}