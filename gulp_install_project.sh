#!/bin/bash

echo "1. Creating project ..."
npm init

echo ""
echo "2 Setting up folder structure ..."

mkdir app
mkdir dist
mkdir app/css
mkdir app/fonts
mkdir app/images
mkdir app/js
mkdir app/scss
mkdir dist/css
mkdir dist/fonts
mkdir dist/images
mkdir dist/js
mkdir dist/scss


echo "<html>
<head>
<link rel=\"stylesheet\" type=\"text/css\" href=\"css/styles.css\" />
</head>
<body>
<h1>Hello World!</h1>
</body>
</html>
" > app/index.html


echo ""
echo "3. Installing dependencies ..."

echo ""
echo "install gulp..."
npm install gulp --save-dev

echo ""
echo "install gulp-sass..."
npm install gulp-sass --save-dev
echo ""
echo "install browser-sync..."
npm install browser-sync --save-dev

echo ""
echo "other dependencies..."
npm install gulp-useref --save-dev
npm install gulp-uglify --save-dev
npm install gulp-if --save-dev
npm install gulp-cssnano --save-dev 
npm install gulp-imagemin --save-dev
npm install gulp-cache --save-dev
npm install del@1.2.1 --save-dev
npm install run-sequence --save-dev

echo ""
echo "4. Creating basic gulpfile ..."

echo "// dependencies
var gulp = require('gulp');
var sass = require('gulp-sass');
var browserSync = require('browser-sync').create();
//var useref = require('gulp-useref');
//var uglify = require('gulp-uglify');
//var gulpIf = require('gulp-if');
//var cssnano = require('gulp-cssnano');
//var imagemin = require('gulp-imagemin');
//var cache = require('gulp-cache');
//var del = require('del');
//var runSequence = require('run-sequence');

// functions. Call with \"gulp <fname>\"

gulp.task('sass', function() {
  return gulp.src('app/scss/**/*.scss') // Gets all files ending with .scss in app/scss
    .pipe(sass())
    .pipe(gulp.dest('app/css'))
    .pipe(browserSync.reload({
      stream: true
    }))
});

gulp.task('watch', ['browserSync', 'sass'], function (){
  gulp.watch('app/scss/**/*.scss', ['sass']); 
  // Other watchers
});

gulp.task('browserSync', function() {
  browserSync.init({
    server: {
      baseDir: 'app'
    },
  })
});

" > gulpfile.js


echo "Done!"
