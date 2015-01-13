gulp = require 'gulp'
wiredep = require('wiredep').stream

gulp.task 'deps', ['jade'], ->
  gulp.src 'www/client/index.html'
  .pipe wiredep({
    options: {cwd: 'www/client'}
    })
  .pipe gulp.dest 'www/client'
