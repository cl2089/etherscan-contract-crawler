// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;
import "./libraries/ECRecovery.sol";

// BEGIN EIP712 AUTOGENERATED SETUP
struct EIP712Domain {
    string name;
    string version;
    uint256 chainId;
    address verifyingContract;
}

bytes32 constant EIP712DOMAIN_TYPEHASH = keccak256(
    "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"
);

struct Invocation {
    Transaction transaction;
    SignedDelegation[] authority;
}

bytes32 constant INVOCATION_TYPEHASH = keccak256(
    "Invocation(Transaction transaction,SignedDelegation[] authority)Caveat(address enforcer,bytes terms)Delegation(address delegate,bytes32 authority,Caveat[] caveats)SignedDelegation(Delegation delegation,bytes signature)Transaction(address to,uint256 gasLimit,bytes data)"
);

struct Invocations {
    Invocation[] batch;
    ReplayProtection replayProtection;
}

bytes32 constant INVOCATIONS_TYPEHASH = keccak256(
    "Invocations(Invocation[] batch,ReplayProtection replayProtection)Caveat(address enforcer,bytes terms)Delegation(address delegate,bytes32 authority,Caveat[] caveats)Invocation(Transaction transaction,SignedDelegation[] authority)ReplayProtection(uint nonce,uint queue)SignedDelegation(Delegation delegation,bytes signature)Transaction(address to,uint256 gasLimit,bytes data)"
);

struct SignedInvocation {
    Invocations invocations;
    bytes signature;
}

bytes32 constant SIGNEDINVOCATION_TYPEHASH = keccak256(
    "SignedInvocation(Invocations invocations,bytes signature)Caveat(address enforcer,bytes terms)Delegation(address delegate,bytes32 authority,Caveat[] caveats)Invocation(Transaction transaction,SignedDelegation[] authority)Invocations(Invocation[] batch,ReplayProtection replayProtection)ReplayProtection(uint nonce,uint queue)SignedDelegation(Delegation delegation,bytes signature)Transaction(address to,uint256 gasLimit,bytes data)"
);

struct Transaction {
    address to;
    uint256 gasLimit;
    bytes data;
}

bytes32 constant TRANSACTION_TYPEHASH = keccak256(
    "Transaction(address to,uint256 gasLimit,bytes data)"
);

struct ReplayProtection {
    uint256 nonce;
    uint256 queue;
}

bytes32 constant REPLAYPROTECTION_TYPEHASH = keccak256(
    "ReplayProtection(uint nonce,uint queue)"
);

struct Delegation {
    address delegate;
    bytes32 authority;
    Caveat[] caveats;
}

bytes32 constant DELEGATION_TYPEHASH = keccak256(
    "Delegation(address delegate,bytes32 authority,Caveat[] caveats)Caveat(address enforcer,bytes terms)"
);

struct Caveat {
    address enforcer;
    bytes terms;
}

bytes32 constant CAVEAT_TYPEHASH = keccak256(
    "Caveat(address enforcer,bytes terms)"
);

struct SignedDelegation {
    Delegation delegation;
    bytes signature;
}

bytes32 constant SIGNEDDELEGATION_TYPEHASH = keccak256(
    "SignedDelegation(Delegation delegation,bytes signature)Caveat(address enforcer,bytes terms)Delegation(address delegate,bytes32 authority,Caveat[] caveats)"
);

// END EIP712 AUTOGENERATED SETUP

contract EIP712Decoder is ECRecovery {
    // BEGIN EIP712 AUTOGENERATED BODY. See scripts/typesToCode.js

    // function GET_EIP712DOMAIN_PACKETHASH(EIP712Domain memory _input)
    //     public
    //     pure
    //     returns (bytes32)
    // {
    //     bytes memory encoded = abi.encode(
    //         EIP712DOMAIN_TYPEHASH,
    //         _input.name,
    //         _input.version,
    //         _input.chainId,
    //         _input.verifyingContract
    //     );

    //     return keccak256(encoded);
    // }

    function GET_INVOCATION_PACKETHASH(Invocation memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded = abi.encode(
            INVOCATION_TYPEHASH,
            GET_TRANSACTION_PACKETHASH(_input.transaction),
            GET_SIGNEDDELEGATION_ARRAY_PACKETHASH(_input.authority)
        );

        return keccak256(encoded);
    }

    function GET_SIGNEDDELEGATION_ARRAY_PACKETHASH(
        SignedDelegation[] memory _input
    ) public pure returns (bytes32) {
        bytes memory encoded;
        for (uint256 i = 0; i < _input.length; i++) {
            encoded = bytes.concat(
                encoded,
                GET_SIGNEDDELEGATION_PACKETHASH(_input[i])
            );
        }

        bytes32 hash = keccak256(encoded);
        return hash;
    }

    function GET_INVOCATIONS_PACKETHASH(Invocations memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded = abi.encode(
            INVOCATIONS_TYPEHASH,
            GET_INVOCATION_ARRAY_PACKETHASH(_input.batch),
            GET_REPLAYPROTECTION_PACKETHASH(_input.replayProtection)
        );

        return keccak256(encoded);
    }

    function GET_INVOCATION_ARRAY_PACKETHASH(Invocation[] memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded;
        for (uint256 i = 0; i < _input.length; i++) {
            encoded = bytes.concat(
                encoded,
                GET_INVOCATION_PACKETHASH(_input[i])
            );
        }

        bytes32 hash = keccak256(encoded);
        return hash;
    }

    // function GET_SIGNEDINVOCATION_PACKETHASH(SignedInvocation memory _input)
    //     public
    //     pure
    //     returns (bytes32)
    // {
    //     bytes memory encoded = abi.encode(
    //         SIGNEDINVOCATION_TYPEHASH,
    //         GET_INVOCATIONS_PACKETHASH(_input.invocations),
    //         keccak256(_input.signature)
    //     );

    //     return keccak256(encoded);
    // }

    function GET_TRANSACTION_PACKETHASH(Transaction memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded = abi.encode(
            TRANSACTION_TYPEHASH,
            _input.to,
            _input.gasLimit,
            keccak256(_input.data)
        );

        return keccak256(encoded);
    }

    function GET_REPLAYPROTECTION_PACKETHASH(ReplayProtection memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded = abi.encode(
            REPLAYPROTECTION_TYPEHASH,
            _input.nonce,
            _input.queue
        );

        return keccak256(encoded);
    }

    function GET_DELEGATION_PACKETHASH(Delegation memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded = abi.encode(
            DELEGATION_TYPEHASH,
            _input.delegate,
            _input.authority,
            GET_CAVEAT_ARRAY_PACKETHASH(_input.caveats)
        );

        return keccak256(encoded);
    }

    function GET_CAVEAT_ARRAY_PACKETHASH(Caveat[] memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded;
        for (uint256 i = 0; i < _input.length; i++) {
            encoded = bytes.concat(encoded, GET_CAVEAT_PACKETHASH(_input[i]));
        }

        bytes32 hash = keccak256(encoded);
        return hash;
    }

    function GET_CAVEAT_PACKETHASH(Caveat memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded = abi.encode(
            CAVEAT_TYPEHASH,
            _input.enforcer,
            keccak256(_input.terms)
        );

        return keccak256(encoded);
    }

    function GET_SIGNEDDELEGATION_PACKETHASH(SignedDelegation memory _input)
        public
        pure
        returns (bytes32)
    {
        bytes memory encoded = abi.encode(
            SIGNEDDELEGATION_TYPEHASH,
            GET_DELEGATION_PACKETHASH(_input.delegation),
            keccak256(_input.signature)
        );

        return keccak256(encoded);
    }
}