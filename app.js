const express = require('express');
const cluster = require('cluster');
const numCpus = require('os').cpus().length;
const init = require('./config/init')(express);
const config = require('./config/config');

(async () => {
    try {
        await config.init();

        app.use(config.response);

        require('./src/api/routes/ping')(app);
        require('./src/api/routes/set')(app, __dirname + '/src');

        if (cluster.isMaster) {
            for (let i = 0; i < numCpus; i++) {
                cluster.fork();
            }

            cluster.on('exit', (worker, code, signal) => {
                console.log(`Worker ${worker.process.pid} is died`);
            });
        } else {
            app.listen(config.settings.api.port, () => {
                console.log(`SERVER WORKER ${process.pid} RUNNING ON PORT ${config.settings.api.port}`);
            });
        }
    } catch (error) {
        console.error(error);
    }
})();

