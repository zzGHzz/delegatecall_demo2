const A = artifacts.require('A')
const B = artifacts.require('B')

contract('DELEGATECALL_DEMO2', async accounts => {
    let a, b
    let inst

    before(async () => {
        a = await A.deployed()
        b = await B.deployed()
    })

    it('Test delegatecall', async () => {
        const val = 100
        const i = 0

        inst = new web3.eth.Contract(A.abi, a.address)
    
        // Create an instance of B and get the contract address
        await inst.methods.newB().send({from: accounts[0]})

        // Testing set/get
        await inst.methods.set(i, val).send({from: accounts[0]})
        const _val = await inst.methods.get(i).call()
        assert.equal(val, _val)
    })
})