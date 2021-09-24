const pingTarget = async (target) => {
    var ping = require('ping');

    var cfg = {
        timeout: 10
    };

    return ping.promise.probe(target, cfg);
}

exports.pingTarget = pingTarget;