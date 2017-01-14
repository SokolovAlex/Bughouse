/**
 * Created by alexs_000 on 17.11.2016.
 */
module.exports = app => {
    var path = require('path');

    var router = app.loopback.Router();

    router.get('/', (req, res) => {
        res.sendFile(path.resolve(__dirname + '/../../public/index.html'));
    });

    return router;
};