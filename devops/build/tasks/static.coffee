gulp = require 'gulp'
flatten = require 'gulp-flatten'

gulp.task 'static', ->
  gulp.src ['src/**/*.png', 'src/**/*.jpg']
  .pipe flatten()
  .pipe gulp.dest 'www/client/img'

  return