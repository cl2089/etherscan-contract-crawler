// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Supper Of Flies
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓╬▒╠╣▓▓╬╬╬╬╬╬╬▓█████    //
//        █████████████████████████▓▓▓▓▓▓▓▓▓████████████▓██▓▓██████████╬▒╠╟▓▒╬╠╠╠╠╬╬╣█████    //
//        ███████████████████████▓▓▓╣▓▓▓▓╣╬▓▓████████████▓╬╬╬╬╬╬╬▓█████╬▒╠╠╠╠╠╬╬╬╬▓▓▓█████    //
//        ███████████████████████╟▓▓▓▓╬█╬╣╬▓▒▓████████▓▓╬╬╬▓▓▓█▓▒╬╠▓███╬▒╠▒╠╠╟▓▓██████████    //
//        ██████████████████████▌▓╬╬╬╬██╬╬╬╬▒▒████████▓╠╬▓▓▒▓╣▌╬█▓╠╠▓██████████╣██████████    //
//        ███████▓╬╬╫╫██████████▒╚╣╬╣╬╬█╣▓╬╬▒╠████████▓╬▓▓▓▓╬╬╬▓▓▓▌╠▓██████████╣╫█████████    //
//        ████████▓██████████████▒▒╩╟╬▓╬╣▓▒▒▒║█████████╬╬╬╬╬▓▓╬╬▓▒╠╣███████████╬▓▓▓███████    //
//        ██████████╬╠▓╠╬█████████▒▒φ╟▓▓▓░▒▒▓███████████▓▓╬╬╬╬▓▓╬╣▓███████████████████████    //
//        █╬█████████▓▓╬╠▒╠█████▓▓██▓▓▓╬▒▄▓█████████████████▓▓▓▓██████████████████████████    //
//        ╬▓▓█████████▓╣▒╬▓██████╠█████████████████████████████████╠╬█████████████████████    //
//        ╩╠╬▓██████╬╣╬▓╬╬████▓╬▓╠╢██████████████▓▓▓██████████████▓Γ░▓███████████▌╠╬██████    //
//        ╠╬╬╠╬╬╬╬██▒▒╣▒╫▓████████▓████████▓╬╬╠╠▒▒╠╠╠▒╠╠╬▓████████▓███████████████╠╫██████    //
//        ▄╬╣█▒╬▌▒╠╬▌▓▒╣▓████████████████╬╠╠╠╠╠╠╠▒▒╠▒╠╬╠╠╠╠╬███████████████████████▓███▓██    //
//        █████▒╠╬▓███╬▓╬▓█████████████▓╬╬╬╬╠╠╠╠▒▒╠▒╠╠╠╠╠╠╠╬╠▓████████████████████████████    //
//        ▓▓███▒╠╠████▒▄╬╣╬███████████╬▓▓▓╬▓╬╫╠╩▒▒╠╠╬╠╠╠╠╬╬╬╬╬╣███████████▀░▒╠╠╠╠╠╠╠▓█████    //
//        ██▓██▒╣╬█╫███╬█▒█╠╬╣╣▓██████▓╬╬╬╬╬╬╬╬╣╬╠╠╬╬╣╣╬╬╬╬╬╬╢╬█████████▓▓╣╬╬▒╬▒╠╠▒╟▒╬▓███    //
//        ╬████╬▓╬█████▓███╬╠▄███████╬▓█████████▓▓╣╣╬▓███████▓╬╬█████████████▓▓▓╣▓▓╫╬▓╬╣██    //
//        ▓████▓█╬█╣███▓███╬╣███████╣▓██╬▓▓█▓╬╬███▓▓╬█▓╣▓██▓╬╟█▓▓███╫█╫▌╫╪▒▒╠╠╬╚▀█████╬▓██    //
//        ███████▓█▓████████████████▓██▓██████╬╣╬▓╬╬▓█╣██████╬▓▓▓███╬▓▓▒╬▓▓╬╠╣▓▓▓▒╟█▓██▓██    //
//        ██████████████████▓███████████▓████╬╬╬▓╬╬╬╣█▓█████╬╬█▓▓███▓▓█▒╟▓▒▒▒Å╬╬╣▒╠█╬██▓██    //
//        █╬╬╬╬╬╟▓╬╬╣▓▓╬╬╬▓╬█╬█████████████████╬╬╬╬╠╬╬╣███▓██████████▓▓▓▓▓███▓▓╬╬╬╣▓██▓▓██    //
//        ▓▓▓▓▓▓▓▓╬╬██▓╬╣╬▓▓▓███████████████▓▓╣╬╬╬╠╠╠╬╠╬╬╬██╣██████╬▒▒████████████▓▓███▓╬╬    //
//        █████▓█╬╬▓▓██▓█▓███████████████▓▓▓▓▓╬╣╬╬╬╢╬╬╬╬╬╢╬╬╬╬╣███╬█▓██▓╢██████████▓█╬▓▓╬▒    //
//        ████▓██╬▓█▓▓█████████████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓█╬████████▓╬▓█▓▓▓█▓╣███▓    //
//        ██████▓█▓╬╬▓█████████████████████████████████▓╬╬╬╬╬╬▓████▓█████████████▓▓▓▓████▓    //
//        ███▓▓██▓╬╬╬▓███████████████╬╬▓████████╬╬╬╬╬╬╠╠╠╠╠╬╬▓╬╬█▓████████████████████████    //
//        █████╬██╬╬╣██████████████╬▓╬╬╬╬██████╬╬╬╬╠╬╬╬╬╬╬╣▓╬╬╬╬▓█▓▓▓▓████████████████████    //
//        ████╬██╬╬▓╣██╬╣█████████╬╬╬╬▓▓▓╬╬╣██████▓▓▓▓██▓╬╬╬╬╣▓╬╬╬╬███████████████████████    //
//        ██████╬╬█╬╣███╬╬████╬╬▓╬╬╬╬╬╬▓╬▓████████████╬╣╬╬╫╬╬▓╬╬╬╬▓╬╬╬╬████████▓▓████████▓    //
//        ████╬╬▓█▓▓▓╣███▓╬╬▓▓▓╣▓▓▓╬╬╬╬╣╬█████████████▓█▓╫╬█╬╬╬╣╬╬█╣╬╬╬╬╬╬▓▓▓▓█████████╬╬╬    //
//        ███████▓▓▓╣▓██╬▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╣╬████████████▓▓██╬╬╬╬╬╬▓╬╬╬╬╬╣╬╬╬╣╬▓████████▓██▓    //
//        ███████╬▓▓╣╣█▓▓▓▓▓▓▓▓▓▓╬▓▓██╬╬█████████████▓▓▓████▓╬╬╣╣╬╬╣╣╬╬╬╣╣╣╣╣▓╬██████╬╬╬╬█    //
//        █████▓╣▓█╬╣█▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣██████▓▓▓▓█████▓▓▓████████╣█▓╬╬╬╣▓▓▓╣╣▓▓▓▓╬█▓█▓▓▓█▓╬█    //
//        ████████╬╣▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████╬╣╣╣▓▓▓▓▓███▓▓▓╣╬▓╬▓╬▓███    //
//        ███████╬▓╬███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬███▓▓▓▓▓▓▓▓▓▓▓▓█▓██▓▓███▓▓▓▓▓▓▓▓█████▓▓▓▓█████████    //
//        ██████████████▓▓▓▓█▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓▓▓▓▓▓▓██████▓▓▓▓▓█████████    //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract F3VST is ERC721Creator {
    constructor() ERC721Creator("Supper Of Flies", "F3VST") {}
}