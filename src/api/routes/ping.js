module.exports = (app) => {
    app.get('/ping', (req, res) => {
        res.ok({ message: `Servidor funcionando ${new Date()}`});
    });
}