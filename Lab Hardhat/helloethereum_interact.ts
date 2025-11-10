import { network } from "hardhat";
const { ethers } = await network.connect();

async function main() {
  // 1. Recupera il factory del contratto
  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const contractDeployed = await ethers.getContractAt("HelloEthereum", contractAddress);
  
  const initialMessage = await contractDeployed.message(); // la variabile pubblica "message" 
     // nel contratto, per richiamarla, si 
     // usa un metodo con lo stesso nome
  console.log("Messaggio iniziale:", initialMessage);
 
 // 2. Chiama la funzione updateMessage
  await contractDeployed.updateMessage("test2");
  const updatedMessage = await contractDeployed.message();
  console.log("Messaggio aggiornato:", updatedMessage);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
