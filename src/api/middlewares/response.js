module.exports = (req, res, next) => {
    res.ok = (content, statusCode) => {
        return res.status(statusCode || 200).json(content);
    };
    res.error = (content, statusCode) => {
        return res.status(statusCode || 500).json(content || { message: 'Ocorreu um erro no servidor' });
    };
    return next();
};