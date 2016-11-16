var loopback = require('loopback');
var boot = require('loopback-boot');
const path = require('path');

var app = module.exports = loopback();

app.use(loopback.static(path.resolve(__dirname, '../public')));

app.use('/api', loopback.rest());

app.use(loopback.static(__dirname + '/../public/views'));

var pages = require('./routes/pages');
app.use('/', pages(app));

// Bootstrap the application, configure models, datasources and middleware.
// Sub-apps like REST API are mounted via boot scripts.
boot(app, __dirname, function(err) {
    if (err) throw err;

    // start the server if `$ node server.js`
    if (require.main === module) {
        console.log('listening ---> localhost:8080');
        app.listen(8080)
    }
});