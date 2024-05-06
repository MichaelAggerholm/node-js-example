const express = require('express');
const app = express();

function sum(a, b) {
    return a + b;
}
// Sender sum med til jest test.
module.exports = sum;

app.get('/', (req, res) => {
    res.send(sum(2,3));
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});