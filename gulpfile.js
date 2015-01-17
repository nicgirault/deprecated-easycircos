require('coffee-script/register');
require('./devops/build/tasks/watch.coffee');
require('./devops/build/tasks/jade.coffee');
require('./devops/build/tasks/coffee.coffee');
require('./devops/build/tasks/deps.coffee');
require('./devops/build/tasks/browserify.coffee');
require('./devops/build/tasks/less.coffee');
require('./devops/build/tasks/static.coffee');

var gulp = require('gulp');
gulp.task('build', [ 'browserify', 'deps', 'less', 'static']);
