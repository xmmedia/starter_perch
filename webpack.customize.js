'use strict';
const path = require('path');

// Tweak the webpack config output of Encore
// Use as a common place for customizations that apply to all webpack envs.
module.exports = {
    stats: {
        assets: true,
        source: true,
    },
};