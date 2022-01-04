const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('MyEpicNFT');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to ", nftContract.address);

    // call the function to mint the NFT 
    let txn = await nftContract.makeAnEpicNFT();
    // wait for it to be mined
    await txn.wait();
    // mint another just because
    txn = await nftContract.makeAnEpicNFT();
    // wait for it to be mined
    await txn.wait();
};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (err) {
        console.log(err);
        process.exit(1);
    }
};

runMain();