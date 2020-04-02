const { expect } = require('@hapi/code')
const {
  describe,
  it
} = (module.exports.lab = require('@hapi/lab').script())

describe('Integration test', () => {
  it('Test should succeed.', () => {
    expect(true).be.true()
  })
})
