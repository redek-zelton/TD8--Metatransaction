# TD8--Metatransaction

- [OpenZeppelin](https://openzeppelin.com/)
- [Truffle](https://trufflesuite.com/)
- [Infura](https://infura.io)

## Setting in truffle
- npm init
- npm i node module
- npm install truffle
- truffle init
- npm install @openzeppelin/contracts@3.4.1
- npm install @truffle/hdwallet-provider
- truffle compile
- truffle migrate --reset --network infura --skip-dry-run

## ex1_testERC721()
- Use your wallet in Rinkeby network
- create an ERC721 contract
- create a contract cans mint the ERC721 with function "mintATokenForMe()"
-  >it's work

## ex2_generateASignature()
- use your private key to sign the hash with  "web3.eth.accounts.sign(_hashToSign,private_key)"
- > it's work

## ex3_extractAddressFromSignature()
- use extractAddress(bytes32 _hash, bytes memory _signature) function
- to extract the signer address
-  > it's work

## ex4_manageWhiteListWithSignature()
- Create a Whitelist to whitelist an address
- create a "signerIsWhitelisted" and "extractAddress(_hash,_signature)" to know if the signer is whitelisted
- > it's work

## ex5_mintATokenWithASpecificSignature()
- use web3.utils.soliditySha3(Evaluator,pub , nft) to hash the data contains: Evaluator,pub_key,nft_address concatenation
- use web3.eth.accounts.sign(dataToSign,private_key) to sign
- create mintATokenForMeWithASignature(bytes calldata _signature) to confirm the owner as signer
- it mints a nft
- > it's work 

## ex6_deployBouncerProxyAndWhitelistYourself()
## ex7_useBouncerProxyToCallEvaluator()

