gulp = require 'gulp'
server = require 'gulp-express'

gulp.task('server', ['build'], ->
  # Restart the server when file changes
  # gulp.watch ['build/**'], server.run
  gulp.watch ['build/server/app.js'], server.run
  gulp.watch 'src/**', ['build']

  # Start the server at the beginning of the task
  server.run
    file: 'build/server/app.js'
)