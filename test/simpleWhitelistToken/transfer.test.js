// const isEVMException = require('./_utils/isEVMException.js');
const SimpleWhitelistTokenAbstraction = artifacts.require('SimpleWhitelistToken');
const SimpleWhitelistAbstraction = artifacts.require('SimpleWhitelist');

contract('SimpleWhitelistToken', function(accounts) {
  const alice = accounts[0];
  const bob = accounts[1];

  describe('.transfer', () => {
    it('should transfer tokens', async () => {
      const WL = await SimpleWhitelistAbstraction.new({from: alice});
      await WL.addAddress(alice, {from: alice});
      await WL.addAddress(bob, {from: alice});
      const instance = await SimpleWhitelistTokenAbstraction.new(
        10000,
        'Vanilla',
        'VNL',
        18,
        WL.address,
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
