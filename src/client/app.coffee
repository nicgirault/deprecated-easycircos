angular.module 'easyCircos.config', []
    .constant 'APP_NAME','EasyCircos'
    .constant 'ITEM_INFO_PATH','info/attributes'
    .constant 'TRACK_DIR','info/track'
    .constant 'APP_VERSION','alpha-0.1'

yaml = require 'js-yaml'

# Load modules
require './modules/angular-colorBrewer-picker/src/colorBrewer.module.js'
require './modules/track/track.module.js'
require './modules/layout/layout.module.js'
require './modules/circosJS/circosJS.module.js'
require './modules/trackManager/trackManager.module.js'
require './modules/html5FileReader/html5FileReader.module.js'
require './modules/uiApp/uiApp.module.js'
require './modules/help/help.module.js'
require './modules/utils/utils.module.js'

angular.module 'easyCircos', ['colorBrewer', 'circosJS', 'trackManager', 'track', 'layout', 'ui.app']

angular.module('easyCircos').factory 'yaml', -> yaml

require './analytics.js'
