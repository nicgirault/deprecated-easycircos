gulp = require 'gulp'
server = require 'gulp-express'
gulpSequence = require 'gulp-sequence'

gulp.task('server', ['build'], ->
  server.run ['build/server/app.js']
)

gulp.task('default', ['build'], ->
  server.run ['build/server/app.js']
  # Restart the server when file changes
  gulp.watch 'src/**', ['server']
)
