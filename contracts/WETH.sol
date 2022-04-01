pragma solidity ^0.8.1;

//solhint-disable no-empty-blocks
contract WETH {
  mapping(address => uint256) public balanceOf;

  function deposit() external payable {
    balanceOf[msg.sender] += msg.value;
  }

  function withdraw(uint256 value) external {
    uint256 balance = balanceOf[msg.sender];
    require(balance >= value, "WETH: burn amount exceeds balance");
    balanceOf[msg.sender] = balance - value;

    (bool success, ) = msg.sender.call{ value: value }("");
    require(success, "WETH: ETH transfer failed");
  }

  receive() external payable {
      balanceOf[msg.sender] += msg.value;
  }
}
