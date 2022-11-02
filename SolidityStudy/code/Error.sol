// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Error1 {
    function testRequire(uint _i) public pure {
        require(_i <= 10, "i > 10");
    }

    function testRevert(uint _i) public pure {
        if (_i > 10) {
            revert("i > 10");
        }
    }

    uint public num = 123;
    function testAssert() public view {
        assert(num == 123);
    }

    function add(uint _i) public{
        num += 1;
        require(_i < 10);
    }

    //自定义错误
    error MyError(address caller, uint i);
    function testCustomError(uint _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}