gulp = require 'gulp'
browserify = require 'gulp-browserify'

gulp.task 'browserify', ['coffee'], ->
  gulp.src 'build/client/app.js'
  .pipe browserify()
  .pipe gulp.dest './www/client/js'
