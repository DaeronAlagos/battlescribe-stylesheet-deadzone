const sass = require('node-sass')

module.exports = function(grunt) {
    grunt.initConfig({
        sass: {
            options: {
                implementation: sass,
                soureMap: true,
            },
            dist: {
                files: {
                    'build/style.css': 'src/scss/style.scss'
                }
            }
        },
        xsltproc: {
            options: {
                stylesheet: 'build/base.xsl'
            },
            compile: {
                files: {
                    'build/template.html': ['data/nameless-rush.ros'],
                }
            }
        },
        browserSync: {
            bsFiles: {
                src: 'build/template.html'
            },
            options: {
                server: {
                    baseDir: 'build',
                    index: 'template.html',
                },
                watchTask: true,
            }
        },
        watch: {
            template: {
                files: ['src/base.xsl', 'src/scss/style.scss'],
                tasks: ['sass', 'replace', 'xsltproc']
            },
        },
        replace: {
            dist: {
                options: {
                    patterns: [
                        {
                            match: 'include_style',
                            replacement: '<%= grunt.file.read("build/style.css") %>',
                        }
                    ]
                },
                files: [
                    {
                        expand: true,
                        flatten: true,
                        src: ['src/base.xsl'],
                        dest: 'build/'
                    }
                ]
            }
        }

    })

    grunt.loadNpmTasks('grunt-browser-sync')
    grunt.loadNpmTasks('grunt-xsltproc')
    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-sass')
    grunt.loadNpmTasks('grunt-replace')
    
    grunt.registerTask('default', ['browserSync', 'watch'])
}
