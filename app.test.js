const sum = require('./app');

test('1 + 2 skal være = 3', () => {
    expect(sum(1, 2)).toBe(3);
});

afterAll(() => {
    server.close();
});