const express = require('express');
const init = require('./config/init')(express);
const config = require('./config/config');

(async () => {
    try {
        await config.init();
        
        app.use(config.response);

        require('./src/api/routes/ping')(app);

        app.listen(config.settings.api.port, () => {
            console.log(`SERVER RUNNING ON PORT ${config.settings.api.port}`);
        });
    } catch (error) {
        console.error(error);
    }
})();

