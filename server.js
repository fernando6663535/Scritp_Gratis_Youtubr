// server.js
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.post('/api/receiveData', (req, res) => {
    const { fuerza } = req.body;
    console.log('Fuerza recibida:', fuerza);
    res.send('Datos recibidos con éxito');
});

app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});