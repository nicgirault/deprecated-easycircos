gulp = require 'gulp'
coffee = require 'gulp-coffee'

gulp.task 'coffee', ->
  gulp.src ['src/**/*.coffee', 'test/**/*.coffee']
  .pipe coffee bare: true
  .pipe gulp.dest 'build'
