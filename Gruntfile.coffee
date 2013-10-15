path = require 'path'
fs = require 'fs'
url = require 'url'

# Rewrite for angular, if file doesn't exist show index.html
urlRewrite = (rootDir, indexFile) ->
    indexFile = indexFile || "index.html"
    return (req, res, next) ->
        path = url.parse(req.url).pathname
         
        fs.readFile './' + rootDir + path, (err, buf) ->
            return next() unless err
             
            fs.readFile './' + rootDir + '/' + indexFile, (error, buffer) ->
                return next(error) if error
                 
                resp =
                    headers:
                        'Content-Type': 'text/html'
                        'Content-Length': buffer.length
                    body: buffer

                res.writeHead 200, resp.headers
                res.end resp.body

module.exports = (grunt) ->
    grunt.initConfig

        copy:
            frontend:
                files: [
                    src: 'bower_components/bazalt/build/frontend.js'
                    dest: 'src/frontend.js'
                ]

        less:
            theme:
                src: 'assets/less/theme.less'
                dest: 'assets/css/theme.css'

        watch:
            css:
                files: 'assets/**/*.less'
                tasks: ['less', 'beep']
                options:
                    livereload: true
            html:
                files: 'views/**/*.html'
                tasks: 'beep'
                options:
                    livereload: true

        connect:
            development:
                options:
                    port: 8000
                    base: 'src'
                    middleware: (connect, options) -> [
                        urlRewrite 'src'
                        connect.static options.base
                        connect.directory options.base
                    ]
                
    grunt.loadNpmTasks 'grunt-contrib-htmlmin'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-requirejs'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.loadNpmTasks 'grunt-beep'

    grunt.registerTask 'dev', [
        'copy:frontend'
        'connect'
        'watch'
    ]
