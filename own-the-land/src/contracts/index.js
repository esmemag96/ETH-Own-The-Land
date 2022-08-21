import { Contract } from "ethers";

import ABI from "./OwnTheLand";

let contract = null;

export default function instantiateContract(signer) {
  if (contract == null) {
    contract = new Contract(
      "0x0A2cDe3a464e1879a3AC757f7F6331cf5ED801d5",
      ABI,
      signer
    );
  }
  return contract;
}
