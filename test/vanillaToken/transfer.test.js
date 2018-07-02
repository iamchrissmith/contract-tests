// const isEVMException = require('./_utils/isEVMException.js');
const VanillaTokenAbstraction = artifacts.require('VanillaToken');

contract('VanillaToken', function(accounts) {
  const alice = accounts[0];
  const bob = accounts[1];

  describe('.transfer', () => {
    it('should transfer tokens', async () => {
      const instance = await VanillaTokenAbstraction.new(
        10000,
        'Vanilla',
        'VNL',
        18,
        {from: alice}
      );
      await instance.transfer(bob, 10000, {from: alice});
      const bobBalance = await instance.balanceOf.call(bob);
      assert.equal(bobBalance.toNumber(), 10000);
      const aliceBalance = await instance.balanceOf.call(alice);
      assert.equal(aliceBalance.toNumber(), 0);
    });
  });
});
