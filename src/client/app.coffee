angular.module 'easyCircos.config', []
    .constant 'APP_NAME','EasyCircos'
    .constant 'ITEM_INFO_PATH','info/attributes'
    .constant 'TRACK_DIR','info/track'
    .constant 'APP_VERSION','alpha-0.1'

yaml = require 'js-yaml'

# Load modules
# require('./modules/tabs/tabs.module.js');
# require('./modules/form/form.module.js');
# require('./modules/createDialog/createDialog.js');
# require('./modules/circosSettings/circosSettings.module.js');
# require('./modules/circosConfig/circosConfig.module.js');
# require('./modules/circosTrack/track.module.js');
# require './modules/colorBrewer/color.module.js'
require './modules/angular-colorBrewer-picker/src/colorBrewer.module.js'
require './modules/layout/layout.module.js'
require './modules/circosJS/circosJS.module.js'
require './modules/trackManager/trackManager.module.js'
require './modules/html5FileReader/html5FileReader.module.js'
require './modules/uiApp/uiApp.module.js'
require './modules/help/help.module.js'
# require('./modules/identification/identification.module.js');
# require('./modules/karyotype/module.js');
# require('./modules/newCircos/newCircosModule.js');
# require('./modules/serverConnector/serverConnector.module.js');
# require('./modules/ui/ui.module.js');
angular.module 'easyCircos', ['colorBrewer', 'circosJS', 'trackManager', 'layout', 'ui.app']

angular.module('easyCircos').factory 'yaml', -> yaml
