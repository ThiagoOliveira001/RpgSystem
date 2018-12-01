module.exports = (express) => {
    app = express(),
    processConfig(),
    appUse()
}

function processConfig() {
    process.env.TZ = 'utc';
}

function appUse() {
    const bodyParser = require('body-parser');
    const cors = require('cors');
    app.use(bodyParser.json({ limit: '10mb' }));
    app.use(bodyParser.urlencoded({ extended: true }));
    app.use(cors());
}