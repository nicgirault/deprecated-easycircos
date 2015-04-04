angular.module 'easyCircos.config', []
    .constant 'APP_NAME','EasyCircos'
    .constant 'NOTIFICATION_DELAY', 2000

yaml = require 'js-yaml'

# Load modules
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
require './modules/circosNotifications/circosNotifications.module.js'
require './modules/export/export.module.js'

angular.module 'easyCircos', [
  'ngResource',
  'ngAnimate',
  'circosJS',
  'trackManager',
  'track',
  'layout',
  'layoutInit',
  'ui.app',
  'ui-notification',
  'circos-notification',
  'news',
  'export',
  'colorBrewer'
]

angular.module('easyCircos').factory 'yaml', -> yaml

require './analytics.js'
