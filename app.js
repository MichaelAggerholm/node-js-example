const express = require('express');
const app = express();

function sum(a, b) {
    return a + b;
}

app.get('/', (req, res) => {
    res.send(sum(2,3));
});

const PORT = process.env.PORT || 3000;
const server = app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

// Sender sum og server med til jest test.
module.exports = sum;
module.exports = server;