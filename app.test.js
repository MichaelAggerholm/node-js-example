const { sum, server } = require('./app');

test('1 + 2 skal være = 3', () => {
    expect(sum(10, 2)).toBe(3);
});

afterAll((done) => {
    server.close(done); // Lukker serveren når alle tests er færdige
});
