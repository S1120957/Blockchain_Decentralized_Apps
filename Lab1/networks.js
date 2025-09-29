module.exports = {
    networks: {
      sepolia: {
        provider: () =>
          new HDWalletProvider(
            'YOUR_METAMASK_PRIVATE_KEY',	   // Metamask private key (never share this publicly)
            'https://eth-sepolia.g.alchemy.com/v2/YOUR _API_KEY'
          ),
        network_id: 11155111,		 // Sepolia Network ID
        gasPrice: 10000000000, 		// 10 gwei
      },
    },
  };  