import WalletConnectProvider from "@walletconnect/web3-provider";

export const provider = new WalletConnectProvider({
  infuraId: "b9db03c0ed2048359a6e7d63e3fe74fd",
  chainId: 80001,
  rpc: {
    80001:
      "https://polygon-mumbai.infura.io/v3/b9db03c0ed2048359a6e7d63e3fe74fd",
  },
  mobileLinks: ["rainbow", "metamask", "argent", "trust", "imtoken", "pillar"],
});
