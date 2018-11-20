/*

  Copyright 2017 Loopring Project Ltd (Loopring Foundation).

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/
pragma solidity 0.4.24;


/// @title IAccountant
/// @author autumn84 - <yangli@loopring.org>

contract IAccountant {


    event UpdateAccountant(
        uint256 indexed seqNo,
        address indexed oldAccountant,
        address indexed newAccountant,
        uint256         hight
    );

    event Withdraw(
        address indexed to,
        address         token,
        uint256         amount
    );

    /// @dev submit infos of the sidechain.
    /// @param root merkle tree root hash.
    /// @param seqNos the sequence number of the accountants.
    /// @param oldAccountants the old accountants which will be replaced.
    /// @param accountants the new accountants.
    /// @param signatures the signature of the accountant.
    function submitBlock(
        uint256 root,
        uint256[] seqNos,
        address[] oldAccountants,
        address[] accountants,
        uint256 hight,
        bytes signatures
        )
        external;

    /// @dev query the accountant of the seqNo
    /// @param seqNo the sequence number of the accountant.
    function queryAccountant(uint256 seqNo) external returns (address);


    /// @dev withdraw tokens
    /// @param to the target address
    /// @param token the token address
    /// @param amount the amount to withdraw
    /// @param path_proof the path of the brother hashes
    function withdraw(
        address to,
        address token,
        uint256 amount,
        uint256[] path_proof
        )
        external;

}