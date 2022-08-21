import { provider } from "../../walletConnect/provider";
import connect from "./index";
const disconnectWallet = async () => {
  const { state } = connect();
  await provider.disconnect();
  state.status = false;
  state.address = "";
  localStorage.removeItem("userState");
};
export default disconnectWallet;
