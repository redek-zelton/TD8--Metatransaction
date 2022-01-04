// EX2 It's Work
const Web3 = require('web3');
const web3 = new Web3();

// Signature for hashtoSign
const str = "0x0605830a47081c4f3F8C4583C624A901945321dB0xC20b819365e52f0C1bF4e500b3aD44F517EbA32E0xa8271d2d99077f88b2053cb603AF68598b592834";
const _hashToSign = web3.utils.keccak256(str)
console.log(_hashToSign);
const private_key=#private_key;
const signature = web3.eth.accounts.sign(_hashToSign,private_key);
console.log(signature);


// Exo5 Signature for datatoSign
const Evaluator="0x0605830a47081c4f3F8C4583C624A901945321dB";
const nft="0x4A8b01da7724a5325af4E4208ac305b681246ca8";
const pub="0xC20b819365e52f0C1bF4e500b3aD44F517EbA32E";
const dataToSign = web3.utils.soliditySha3(Evaluator,pub , nft);
const signatureEX5 = web3.eth.accounts.sign(dataToSign,private_key);
console.log(signatureEX5);
