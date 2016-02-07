module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    browserify:
      'app/game.js': ['app/game.js']

    coffee:
      compile:
        files:
          'app/background.js': ['src/background.coffee']
          'app/game.js': ['src/game.coffee']
          'app/core.js': ['src/core/*.coffee']
          'app/ui.js':     ['src/ui.coffee']
          'test.js':   [
            'test/config.coffee',
            'test/**/*.coffee'
          ]
    slim:
      dist:
        files:
          'app/index.html': ['src/index.slim']

    tape:
      options:
        pretty: false
        output: 'console'
      files: ['test.js']

    watch:
      coffee:
        files: ['src/**/*.coffee', 'test/**/*.coffee'],
        tasks: ['coffee', 'test', 'browserify']
      slim:
        files: ['src/*.slim']
        tasks: 'slim'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-slim'
  grunt.loadNpmTasks 'grunt-tape'
  grunt.registerTask 'test', 'tape'
  grunt.registerTask 'default', ['coffee', 'slim']
  grunt.loadNpmTasks 'grunt-browserify'
