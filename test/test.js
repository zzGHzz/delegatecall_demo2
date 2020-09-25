const Management = artifacts.require('Management')

contract('DELEGATECALL_DEMO2', async accounts => {
    let manager
    let inst

    before(async () => {
        manager = await Management.deployed()
    })

    it('Test', async () => {
        const val = 100
        const i = 0

        inst = new web3.eth.Contract(Management.abi, manager.address)
    
        // Create an instance of B and get the contract address
        await inst.methods.newObject().send({from: accounts[0]})

        // Testing set/get
        await inst.methods.set(i, val).send({from: accounts[0]})
        const _val = await inst.methods.get(i).call()
        assert.equal(val, _val)
    })
})