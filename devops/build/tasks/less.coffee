gulp = require 'gulp'
less = require 'gulp-less'
concat = require 'gulp-concat'

gulp.task 'less', ->
  gulp.src 'src/**/*.less'
  .pipe less()
  .pipe concat 'easyCircos.css'
  .pipe gulp.dest 'www/client/css'

  return