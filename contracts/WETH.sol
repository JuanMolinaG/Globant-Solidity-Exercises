pragma solidity ^0.8.1;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20("The little boy", "TLB") {
    //solhint-disable no-empty-blocks
    constructor() {}

    function deposit() external payable {
        _mint(msg.sender, msg.value);
    }

    function withdraw(uint256 value) external {
        _burn(msg.sender, value);
    }

    receive() external payable {
        _mint(msg.sender, msg.value);
    }
}
