module.exports = function(grunt) {
    grunt.initConfig({
        browserSync: {
            bsFiles: {
                src: 'src/*'
            },
            options: {
                server: {
                    baseDir: 'src',
                    index: 'index.html',
                }
            }
        }

    })

    grunt.loadNpmTasks('grunt-browser-sync')

    grunt.registerTask('default', ['browserSync'])
}