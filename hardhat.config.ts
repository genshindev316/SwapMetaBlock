import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    hardhat: {
      accounts: {
        accountsBalance: '400000000000000000000000000000000000000000000000000',
      },
    },
    live: {
      url: `${process.env.RPC_URL}`,
      gasPrice: 120000000000,
    },
    polygon: {
      url: `${process.env.RPC_URL_POLYGON}`,
    },
    polygon_amoy: {
      url: `${process.env.RPC_URL_POLYGON_AMOY}`
    },
    dev: {
      url: 'http://localhost:8545',
    },
    polygon_dev: {
      url: 'http://localhost:8546',
    },
  },
};

export default config;
