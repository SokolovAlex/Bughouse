const app = require('../../server/server'),
    _ = require("lodash");

module.exports = function(user) {
    user.disableRemoteMethod("updateAll", true);
    user.disableRemoteMethod("updateAttributes", false);
    user.disableRemoteMethod("confirm", true);
    user.disableRemoteMethod("count", true);
    user.disableRemoteMethod("exists", true);
    user.disableRemoteMethod("resetPassword", true);
    user.disableRemoteMethod('createChangeStream', true);
};