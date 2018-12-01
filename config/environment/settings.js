const config = {
    name: 'RpgSystem',
    mongo: {
        user: process.env.MONGO_USER || '',
        password: process.env.MONGO_PASSWORD || '',
        host: process.env.MONGO_HOST || 'localhost',
        port: process.env.MONGO_PORT || 27017,
        database: process.env.MONGO_DATABASE || 'RpgSystem',
        auth: process.env.MONGO_AUTH || 'admin',
        getUri: () => {
            return `mongodb://${config.mongo.host}:${config.mongo.port}/${config.mongo.database}`;
        },
        options: {
            useNewUrlParser: true,
            reconnectInterval: 500,
            reconnectTries: Number.MAX_VALUE,
            poolSize: 10,
            user: process.env.MONGO_USER || '',
            pass: process.env.MONGO_PASSWORD || ''
        }
    },
}

module.exports = config;