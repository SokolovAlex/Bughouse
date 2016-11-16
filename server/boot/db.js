/**
 * Created by alexs_000 on 17.11.2016.
 */
var loopback = require('loopback');

var memory = loopback.createDataSource({
    connector: loopback.Memory,
    file: "data.json"
});