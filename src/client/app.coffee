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
require './modules/rules/rules.module.js'
require './modules/news/news.module.js'

angular.module 'easyCircos', ['ngResource', 'colorBrewer', 'circosJS', 'trackManager', 'track', 'layout', 'layoutInit', 'ui.app', 'ui-notification', 'news']

angular.module('easyCircos').factory 'yaml', -> yaml

angular.module('easyCircos').constant 'NOTIFICATION_DELAY', 5000


require './analytics.js'
