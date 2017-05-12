require('coffee-script/register');

var gulp    = require('gulp');
var gulpNgConfig = require('gulp-ng-config');
var builder = require('webapp-gulp-builder');

var gulpConfig = require('./gulp.config.coffee');

builder(gulp, gulpConfig);
