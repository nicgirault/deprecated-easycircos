gulp = require 'gulp'
jade = require 'gulp-jade'

gulp.task 'jade', ->
  gulp.src 'src/**/*.jade'
  .pipe jade pretty: true
  .pipe gulp.dest 'www'
