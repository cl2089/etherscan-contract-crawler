// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: EyesTeethFlesh
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//           _______ __   __ _______ _______ _______ _______ _______ _______ _     _ _______        _______ _______ _     _                    //
//           |______   \_/   |______ |______    |    |______ |______    |    |_____| |______ |      |______ |______ |_____|                    //
//           |______    |    |______ ______|    |    |______ |______    |    |     | |       |_____ |______ ______| |     |                    //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                             @****@                                                                          //
//                                                          #*,******,*#                                                                       //
//                                                         @.**********[email protected]                                                                      //
//                                                        @****,****,****@                                                                     //
//                                                       @****,******,****@                                                                    //
//                                                      @****,,*,**,*,,****@                                                                   //
//                                                    ./***,,*,*****,,*,,***/.                                                                 //
//                                                   &*****,,**,,**,***,,*****@                                                                //
//                                                 &*/******,**/****/*,,******/*%                                                              //
//                                               @************,******,,***********@                                                            //
//                                              /****,*,*********,,***,*****,*,****/                                                           //
//                                            (*@*****,****/*,,,.//,,,,*/****,*****@*(                                                         //
//                                           @@*********,**/,***,//,***,/**,*********@&                                                        //
//                                          @*****,******************************,*****@                                                       //
//                                         &(*,*****,,******//********//******,,*****,*(%                                                      //
//                                        #***@%*******/***/*/********/*/***/*******%@***#                                                     //
//                                       @**@**#*,,**********/********/**********,,*#**@**@                                                    //
//                                       @@**********************************************@@                                                    //
//                                    %,,*@/******/%@/*&%*@*************/@*%@*/@%(******/@*,,%                                                 //
//                                 @*%%#*/,(,%@////,/*/#/*%*@@********@@*%*/#/*/,////@%,(,/,#%&*@                                              //
//                                *%&***%***@//**@@*/**.#*/,&*%******%,&*/*#.*,/*@@**//@***%***&%*                                             //
//                                 %,*(***@(/***@@*//// //****/%/**/%/,***(/ ////*@@***/(@***(**%                                              //
//                                   #,**@(///@@@%////.(@,**,/*@@**@@*/,***@/.////&@@@///(@**,#                                                //
//                                     #*#///@@&,/**///&*##**************%#*&///*//,&@@///#*(                                                  //
//                                     @((*/@@**/*////@*/*,*,****,,,***,*,*/*@////*/**@@**((@                                                  //
//                                    @((@/*(///////@******,,,**,**,***,,******@///////(//@((@                                                 //
//                                     %*@/@(///&@**#/***,*,,*(******(*,,,,,***#**@&//*/@/@*%                                                  //
//                                     //@/,**/***********,**/((((#(((/**,********,**/***(@//                                                  //
//                                      @@****,************#/&(&,,,,&(&/#*****************@@                                                   //
//                                        @/********,***,***(((@@%%@@(((***,***,********/@                                                     //
//                                         ((&@@@@@//**,*#/@(.(@&%%&@(.(@/#*****/@@@@@&((                                                      //
//                                        @(,(((((((((((((.((((@#&@#@((((.(((((((((((((,(@                                                     //
//                                       @@(&(/(((((((((((((((((.,,.(((((((((((((((((//&(@@                                                    //
//                                        %(%(/((((((&/((@(/,((((##/((/,/(@((/&((((((((%(#                                                     //
//                                          @#(/((/(@,/(@#(/((@/#((#*@/(/((@(/*@(/((/(#@                                                       //
//                                          &(,((*(@%(%@((./(@(&.  .&(@(/.(#@%(%@(/((,(&                                                       //
//                                         @#(((((@ &((((((@@,        ,@@((((((& @(((((%@                                                      //
//                                        @((((((#(&(((((/((            ((/(((((&(%((((((@                                                     //
//                                       ,((((((.((/(&@&/((@#          #@((/@@&(/((.((((((,                                                    //
//                                       @(/((& /(((( [email protected]/((%@          @%((/@. (#((/ &((((@                                                    //
//                                       @(((# &/(&((  #(((@&          &@(((#  ((&(/& #(((@                                                    //
//                                       @/((&@*((@(( /(&(((@          @(((&(* ((@((*@%(((@                                                    //
//                                       /((#@(((@(((*@(%(((#          #(((%(@*(((@(((@#((/                                                    //
//                                        #(((@(# *(/##.(@((#@        @(((@(.##/(, #(@((/(                                                     //
//                                        *@*((@  *((#/*(@(((%        %(((@(*(#((*  @((*@*                                                     //
//                                      ,((((((%  @(@#((& @((@@      @@((@ &((#@(@  %((((((,                                                   //
//                                   @(((@  (((# @(@.(((@ @(((%      %(((@ @((([email protected](@ #(((  @(((@                                                //
//                               @(((&      #((&%(* @(((@ @((((%    %((((@ @(((@ *(&&((#      &(((@                                            //
//                            ((((%        @(((@    @/(&  @((((.    .((((@  @(/@   [email protected](/(@        &((((                                         //
//                          %/((,        &(@((%     &(((  &(((#      #(((&  (((&     %((@(&        ,((/%                                       //
//                         #((         */@ @((      @.(@  (/((&      &((/(  @([email protected]      ((@ @/*         ((%                                      //
//                        ((@          (@ &(&       .((@ &(/((%      %((/(@ @((.       %/& @(          @((                                     //
//                       &(@          @(/((&         &(@@((((%        %((((@@(&         &((*(@          &(@                                    //
//                      ,/#           &(#.            %@(/((&          &((/(@%            ,#(&           #/,                                   //
//                      #(             (#             %((((,            ,/(((%             #(             (%                                   //
//                                     ((          %((((@&/,            ,/&@((((%          ((                                                  //
//                                              #((/(@.   @(            (@   ,@(/((#                                                           //
//                                            &(((@.       (&          &(       [email protected](/(&                                                         //
//                                          (((#,          #(          ((          ,%(((                                                       //
//                                        %/(@             ##          ##             @(/%                                                     //
//                                       ((&               /@          @/               @((                                                    //
//                                                        ((            ((                                                                     //
//                                                       @(.            .(&                                                                    //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
//                                                                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract ETF is ERC721Creator {
    constructor() ERC721Creator("EyesTeethFlesh", "ETF") {}
}