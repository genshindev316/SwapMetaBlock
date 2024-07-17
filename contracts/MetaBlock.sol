/*
███╗░░░███╗███████╗████████╗░█████╗░██████╗░██╗░░░░░░█████╗░░█████╗░██╗░░██╗
████╗░████║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔══██╗██╔══██╗██║░██╔╝
██╔████╔██║█████╗░░░░░██║░░░███████║██████╦╝██║░░░░░██║░░██║██║░░╚═╝█████═╝░
██║╚██╔╝██║██╔══╝░░░░░██║░░░██╔══██║██╔══██╗██║░░░░░██║░░██║██║░░██╗██╔═██╗░
██║░╚═╝░██║███████╗░░░██║░░░██║░░██║██████╦╝███████╗╚█████╔╝╚█████╔╝██║░╚██╗
╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝*/
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC404} from "./ERC404.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract MetaBlock is ERC404 {
    using Strings for uint256;

    string public dataURI;
    string public baseTokenURI;

    constructor(address _owner) ERC404("MetaBlock", "MBT", 18, 9999, _owner) {
        balanceOf[_owner] = 9999 * 10 ** 18;
    }

    function setDataURI(string memory _dataURI) public onlyOwner {
        dataURI = _dataURI;
    }

    function setTokenURI(string memory _tokenURI) public onlyOwner {
        baseTokenURI = _tokenURI;
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        if (bytes(baseTokenURI).length > 0) {
            return string.concat(baseTokenURI, Strings.toString(id));
        } else {
            uint8 seed = uint8(bytes1(keccak256(abi.encodePacked(id))));
            string memory image;
            string memory name;

            if (seed <= 20) {
                image = "1.png";
                name = "Arcturon";
            } else if (seed <= 27) {
                image = "2.png";
                name = " Axiomar";
            } else if (seed <= 34) {
                image = "3.png";
                name = "Azulon";
            } else if (seed <= 40) {
                image = "4.png";
                name = "Alpharex";
            } else if (seed <= 48) {
                image = "5.png";
                name = "Amarith";
            } else if (seed <= 60) {
                image = "6.png";
                name = "Antareon";
            } else if (seed <= 65) {
                image = "7.png";
                name = "Aurixia";
            } else if (seed <= 72) {
                image = "8.png";
                name = "Aetherius";
            } else if (seed <=80) {
                image = "9.png";
                name = "Anaxion";
            } else if (seed <=90) {
                image = "10.png";
                name = "Alarion";
            } else if (seed <=95) {
                image = "11.png";
                name = "Braxonis";
            } else if (seed <=102) {
                image = "12.png";
                name = "Borelium";
            } else if (seed <= 109) {
                image = "13.png";
                name = "Belpharion";
            } else if (seed <= 118) {
                image = "14.png";
                name = "Borakai";
            } else if (seed <= 130) {
                image = "15.png";
                name = "Balenthor";
            } else if (seed <= 170) {
                image = "16.png";
                name = "Brixal";
            } else if (seed <= 190) {
                image = "17.png";
                name = "Bazura";
            } else if (seed <= 195) {
                image = "18.png";
                name = "Blytharos";
            } else if (seed <=200) {
                image = "19.png";
                name = "Bantori";
            } else if (seed <= 222) {
                image = "20.png";
                name = "Brelax";
            } else if (seed <= 230) {
                image = "21.png";
                name = "Cervionix";
            } else if (seed <= 238) {
                image = "22.png";
                name = "Cythara";
            } else if (seed <= 245) {
                image = "23.png";
                name = "Corialus";
            } else if (seed <= 250) {
                image = "24.png";
                name = "Calibrex";
            } else if (seed <= 255) {
                image = "25.png";
                name = "Crysanthar";
            } else if (seed <= 260) {
                image = "26.png";
                name = "Caelumon";
            } else if (seed <= 290) {
                image = "27.png";
                name = "Cenobara";
            } else if (seed <= 300) {
                image = "28.png";
                name = "Cloraxian";
            } else if (seed <= 315) {
                image = "29.png";
                name = "Cygnara";
            } else if (seed <= 330) {
                image = "30.png";
                name = "Cadoxus";
            } 

            string memory jsonPreImage = string.concat(
                string.concat(
                    string.concat(
                        '{"name": "Alien Auras #',
                        Strings.toString(id)
                    ),
                    '","description":"MetaBlock presents an exclusive collection of 9,999 Aliens on the ERC-404 standard, each meticulously crafted to captivate collection.","external_url":"https://www.metablock.trade/","image":"'
                ),
                string.concat(dataURI, image)
            );
            string memory jsonPostImage = string.concat(
                '","attributes":[{"trait_type":"Name","value":"',
                name
            );
            string memory jsonPostTraits = '"}]}';

            return
                string.concat(
                    "data:application/json;utf8,",
                    string.concat(
                        string.concat(jsonPreImage, jsonPostImage),
                        jsonPostTraits
                    )
                );
        }
    }
}