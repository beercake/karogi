module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'build/karogi.js': ['src/*.coffee']
          'build/test.js':   ['test.coffee', 'test/*.coffee']
    slim:
      dist:
        files:
          'build/index.html': ['src/index.slim']

    tape:
      options:
        pretty: false
        output: 'console'
      files: ['build/test.js']

    watch:
      clear:
        files: ['**/*'],
        tasks: ['clear']
      coffee:
        files: ['src/*.coffee', 'test/*.coffee'],
        tasks: ['coffee', 'test']
      slim:
        files: ['src/*.slim']
        tasks: 'slim'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-slim'
  grunt.loadNpmTasks 'grunt-tape'
  grunt.loadNpmTasks 'grunt-clear'
  grunt.registerTask 'test', 'tape'
  grunt.registerTask 'default', ['coffee', 'slim']
