// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

/// @title Election factory contract
/// @author Team-d
/// @dev The contract extends the AccessControl contract by overriding the revokeRole and 
/// @dev renounceRole methods with checks to meet the needed behaviour

contract ElectionAccessControl is AccessControl {
    /// @dev Declares and initialises various roles
    bytes32 public constant CHAIRMAN_ROLE = keccak256("CHAIRMAN_ROLE");
    bytes32 public constant VOTER_ROLE = keccak256("VOTER_ROLE");

    event RenounceRole(address indexed previousChairman, address indexed newChairman);

    constructor(address _owner) {
        super._setRoleAdmin(VOTER_ROLE, VOTER_ROLE);
        super._setRoleAdmin(CHAIRMAN_ROLE, CHAIRMAN_ROLE);

        /// @dev Assigns the Chairman role to a user
        super._grantRole(CHAIRMAN_ROLE, _owner);
    }

    /**
     * @dev Revokes `role` from the calling account and adds a new account to the role. 
     * @dev It is only open to the CHAIRMAN_ROLE
     *
     * @dev The new account should be that of a director.
     */
    function renounceRole(bytes32 _role, address _account) public override onlyRole(CHAIRMAN_ROLE) {
        require(_role == CHAIRMAN_ROLE, "Only the chairman role can be renounced.");

        super._grantRole(CHAIRMAN_ROLE, _account);

        super._revokeRole(CHAIRMAN_ROLE, msg.sender);

        emit RenounceRole(msg.sender, _account);
    }

    /**
     * @dev Revokes `role` from `account` except the chairman role.
     */
    function revokeRole(bytes32 _role, address _account) public override onlyRole(getRoleAdmin(_role)) {
        if(super.hasRole(CHAIRMAN_ROLE, _account)) {
            revert('Chairman role cannot be revoked');
        }

       super._revokeRole(_role, _account);
    }
}