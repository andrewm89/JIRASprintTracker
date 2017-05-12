config = {}

config.minify = true

config.livereload = false
config.lint = true

config.input = {}
# Where sources are located
config.input.path = 'src'
# Main index file
config.input.jade = "#{config.input.path}/index.jade"
# Where to find templates
config.input.template = [
  "#{config.input.path}/*.jade"
  "#{config.input.path}/**/*.jade"
]
# Where to find coffee files
config.input.coffee = [
  "#{config.input.path}/{,**/}*.coffee"
  "!#{config.input.path}/{,**/}*.test.coffee"
]

config.input.vendor = {}
config.input.vendor.watch = [
  'bower.json'
  'bower_components/*'
]

config.input.replace = {}
config.input.replace.enabled = true
config.input.replace.patterns = []

config.input.manifest = {}
config.input.manifest.enabled = false
config.input.manifest.source = 'www/**'
config.input.manifest.settings =
  filename: 'app.manifest'
  cache: undefined
  exclude: 'app.manifest'
  network: ['*']
  fallback: undefined
  preferOnline: undefined
  hash: true

# Static files
config.input.static = {}
# Can add keys in both input and output to add static profile
config.input.static.fonts = []
config.input.static.i18n = [
  "#{config.input.path}/static/i18n/*"
]
config.input.static.i18nAngular = [
  "bower_components/angular-i18n/angular-locale_en.js"
]
config.input.static.images = [
  "#{config.input.path}/static/images/*"
]
config.input.static.scripts = [
  'bower_components/please-wait/build/please-wait.min.js'
]
config.input.static.styles = [
  'bower_components/please-wait/build/please-wait.css'
  'bower_components/spinkit/css/spinkit.css'
]

config.input.loopback = {}
config.input.loopback.enabled = false

config.output = {}
# Output directory
config.output.path = '../static'

config.output.script = "#{config.output.path}/js"

config.output.application = 'application.js'

config.output.template = {}
config.output.template.filename = 'templates.js'
config.output.template.module = 'AngularFlaskBoilerplate.template'

config.output.vendor = 'vendor.js'

config.output.manifest = config.output.path

config.output.static = {}
config.output.static.fonts = "#{config.output.path}/fonts"
config.output.static.images = "#{config.output.path}/images"
config.output.static.scripts = "#{config.output.path}/js"
config.output.static.styles = "#{config.output.path}/css"

# Where to find sass file(s)
config.input.sass = {}
config.input.sass.enabled = true
config.input.sass.main = "#{config.input.path}/style/main.scss"
config.input.sass.watch = [
  "#{config.input.path}/**/*.scss"
]
config.output.sass = "#{config.output.path}/css"

module.exports = config
