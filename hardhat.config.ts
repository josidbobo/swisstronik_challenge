import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import ("dotenv").config();

module.exports = {
  solidity: "0.8.0",
  networks: {
    swisstronik: {
      url: process.env.RPC_URL,
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};

export default config;

https://json-rpc.testnet.swisstronik.com