module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'build/karogi.js': ['src/*.coffee']
    slim:
      dist:
        files:
          'build/index.html': ['src/index.slim']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-slim'
  grunt.registerTask 'default', ['coffee', 'slim']
