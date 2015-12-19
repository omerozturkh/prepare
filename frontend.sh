#!/bin/bash

clear

if test ! $(which brew); then
    echo "Brew kuruluyor..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

if test ! $(which dialog); then
    brew install dialog
    dialog --create-rc ~/.dialogrc
else
    dialog --checklist "Kurulacak bower modüllerini seçin :" 15 40 5 \
        1 Bootstrap off \
        2 Materializecss off \
        3 OwlCarousel off \
        4 Fancybox off 2> tmp
fi;
filename=tmp
while read -r line
do
    name=$line
    echo "Name read from file - $name"
done < "$filename"
exit

read -p "Projenin hazırlanacağı dizin : " DIR

if [ ! -d $DIR ]; then
    mkdir -p $DIR
    cd $DIR

    touch ./.gitignore
    echo "node_modules
src/components/*" > ./.gitignore

    touch index.html
    echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"utf-8\">
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">

    <title>"$DIR"</title>

    <link href=\"src/components/bootstrap/dist/css/bootstrap.min.css\" rel=\"stylesheet\">
    <link href=\"src/components/font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\">

    <link href=\"dist/assets/css/all.min.css\" rel=\"stylesheet\">

    <!--[if lt IE 9]>
        <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>
        <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>
    <![endif]-->
</head>

<body>

    <nav class=\"navbar navbar-inverse navbar-fixed-top\">
        <div class=\"container\">
            <div class=\"navbar-header\">
                <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">
                    <span class=\"sr-only\">Toggle navigation</span>
                    <span class=\"icon-bar\"></span>
                    <span class=\"icon-bar\"></span>
                    <span class=\"icon-bar\"></span>
                </button>
                <a class=\"navbar-brand\" href=\"#\">Project name</a>
            </div>
            <div id=\"navbar\" class=\"collapse navbar-collapse\">
                <ul class=\"nav navbar-nav\">
                    <li class=\"active\"><a href=\"#\">Home</a></li>
                    <li><a href=\"#about\">About</a></li>
                    <li><a href=\"#contact\">Contact</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

    <div class=\"container\">

        <div class=\"starter-template\">
            <h1>Bootstrap starter template</h1>
            <p class=\"lead\">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
        </div>

    </div><!-- /.container -->


    <script src=\"src/components/jquery/dist/jquery.min.js\"></script>
    <script src=\"src/components/bootstrap/dist/js/bootstrap.min.js\"></script>

    <script src=\"dist/assets/js/all.min.js\"></script>
</body>
</html>" > index.html

    mkdir -p src
    mkdir -p src/styles
    touch src/styles/_variables.scss
    touch src/styles/_mixins.scss
    touch src/styles/_basicss.scss

    echo "/**
* 1. http://www.paulirish.com/2012/box-sizing-border-box-ftw/
*    http://css-tricks.com/inheriting-box-sizing-probably-slightly-better-best-practice/
*    http://fatihhayrioglu.com/css3-box-sizing-ozelligi/
*
* 2. http://aestheticallyloyal.com/public/optimize-legibility/
*
* 3. http://maxvoltar.com/archive/-webkit-font-smoothing
*
* 4. http://maximilianhoffmann.com/posts/better-font-rendering-on-osx
*    http://stackoverflow.com/questions/14409647/how-to-antialias-svg-text-in-firefox/18310579#18310579
*
* 5. http://www.sitepoint.com/cross-browser-web-fonts-part-3/
*    http://clagnut.com/sandbox/css3/
*    http://blog.typekit.com/2014/02/05/kerning-on-the-web/
*    https://developer.mozilla.org/en-US/docs/Web/CSS/font-kerning
*
* 6. http://css-tricks.com/almanac/properties/h/hyphenate/
*
* 7. Bu özelliği isteğe bağli kullanabilir veya kaldırabilirsiniz. Detaylı bilgi için alttaki sayfaya göz atın
*    http://css-tricks.com/snippets/css/remove-gray-highlight-when-tapping-links-in-mobile-safari/
*/

*, *:before, *:after {
    box-sizing: inherit; /* 1 */
}

html {
    box-sizing: border-box; /* 1 */
    font-weight: normal;
    font-size: 100%;
    line-height: normal;
    font-family: Helvetica, Arial, sans-serif;
    color: #333;
    background-color: #fff;
}

body, input, textarea, select, button {
    text-rendering: optimizeLegibility; /* 2 */
    -webkit-font-smoothing: antialiased; /* 3 */
    -moz-osx-font-smoothing: grayscale; /* 4 */
}

p {
    font-feature-settings: \"kern\" 1; /* 5 */
    font-kerning: normal; /* 5 */
    hyphens: auto; /* 6 */
}

a {
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0); /* 7 */

    &:hover,
    &:focus,
    &:active {
        text-decoration: underline;
    }
}

img {
    vertical-align: middle;
}

blockquote, dl, dd, h1, h2, h3, h4, h5, h6, figure, p, pre, fieldset, ul, ol, menu {
    margin: 0;
}

button, fieldset, iframe {
    border: 0;
}

fieldset, nav ul, nav ol, button, menu {
    padding: 0;
}

nav ol, nav ul {
    list-style: none;
}

textarea {
    resize: vertical;
}" > src/styles/_basicss.scss

    touch src/styles/theme.scss

    echo "@import 'bourbon';
@import 'basicss';
@import 'variables';
@import 'mixins';

body {
    padding-top: 50px;
}
.starter-template {
    padding: 40px 15px;
    text-align: center;
}" > src/styles/theme.scss

    mkdir -p src/scripts
    touch src/scripts/init.js

    echo "(function ($) {
    'use strict';

    // buraya js kodlarını yaz.
})(jQuery);" > src/scripts/init.js

    mkdir -p src/components
    mkdir -p dist
    mkdir -p dist/assets
    mkdir -p dist/assets/css
    mkdir -p dist/assets/js
    mkdir -p images

    ### bower konfigüre ediliyor
    echo ".bowerrc oluşturuluyor..."
    touch ./.bowerrc
    echo "{
    \"directory\": \"src/components/\"
}" > ./.bowerrc

    echo "bower.json oluşturuluyor..."
    touch ./bower.json
    echo "{
    \"name\": \""$DIR"\",
    \"dependencies\": {
    }
}" > ./bower.json

    if test ! $(which bower); then
        echo "Bower kuruluyor..."
        sudo npm i bower -g
    fi;
    dialog --checklist "Kurmak istediğiniz bower modüllerini seçin:" 10 40 3 1 RedHat on 2 "Ubuntu Linux" off 3 Slackware off
    bower install
    ### / bower konfigüre edildi

    ### gulp konfigüre ediliyor
    if test ! $(which gulp); then
        echo "Gulp kuruluyor..."
        sudo npm i gulp gulp-ruby-sass gulp-autoprefixer gulp-minify-css node-bourbon gulp-jshint gulp-concat gulp-uglify gulp-notify gulp-rename -g
    fi;

    echo "Gulp modülleri bağlanıyor..."
    sudo npm link gulp gulp-ruby-sass gulp-autoprefixer gulp-minify-css node-bourbon gulp-jshint gulp-concat gulp-uglify gulp-notify gulp-rename

    echo "gulpfile.js oluşturuluyor..."
    touch ./gulpfile.js
    echo "var gulp = require('gulp'),
sass = require('gulp-ruby-sass'),
autoprefixer = require('gulp-autoprefixer'),
minifycss = require('gulp-minify-css'),
concat = require('gulp-concat'),
jshint = require('gulp-jshint'),
uglify = require('gulp-uglify'),
rename = require('gulp-rename'),
notify = require('gulp-notify');

gulp.task('styles', function() {
    return sass('src/styles/**/*.scss', {
            loadPath: require('node-bourbon').includePaths,
            style: 'expanded'
        }).on('error', sass.logError)
        .pipe(autoprefixer('last 2 version'))
        .pipe(gulp.dest('dist/assets/css'))
        .pipe(concat('all.css'))
        .pipe(gulp.dest('dist/assets/css'))
        .pipe(rename({suffix: '.min'}))
        .pipe(minifycss())
        .pipe(gulp.dest('dist/assets/css'))
        .pipe(notify({ message: 'Styles task complete' }));
});

gulp.task('scripts', function() {
    return gulp.src('src/scripts/**/*.js')
        .pipe(jshint('.jshintrc'))
        .pipe(jshint.reporter('default'))
        .pipe(concat('all.js'))
        .pipe(gulp.dest('dist/assets/js'))
        .pipe(rename({suffix: '.min'}))
        .pipe(uglify())
        .pipe(gulp.dest('dist/assets/js'))
        .pipe(notify({ message: 'Scripts task complete' }));
});

gulp.task('watch', function() {
    gulp.watch('src/styles/**/*.scss', ['styles']);
    gulp.watch('src/scripts/**/*.js', ['scripts']);
});

gulp.task('default', ['styles', 'scripts', 'watch']);
" > ./gulpfile.js

    echo ".jshintrc oluşturuluyor..."
    touch ./.jshintrc
    echo "{
    \"camelcase\": true,
    \"curly\": true,
    \"eqeqeq\": true,
    \"freeze\": true,
    \"indent\": 2,
    \"newcap\": false,
    \"quotmark\": \"single\",
    \"maxdepth\": 3,
    \"maxstatements\": 50,
    \"maxlen\": 80,
    \"eqnull\": true,
    \"funcscope\": true,
    \"strict\": true,
    \"undef\": true,
    \"unused\": false,
    \"node\": true
}" > ./.jshintrc
    ### / gulp konfigüre edildi

    ### readme dosyası oluşturuluyor
    touch ./readme.md
    echo "## project" $DIR "
### Oluşturulan dizinler

--dist
|----assets
|------css
|------js
--images
--src
|----styles
|----scripts
|----components

### Kurulan modüller (global olarak)

- gulp
- gulp-ruby-sass
- gulp-autoprefixer
- gulp-minify-css
- node-bourbon
- gulp-jshint
- gulp-concat
- gulp-uglify
- gulp-notify
- gulp-rename

npm link moduladi şeklinde hepsi projeye bağlandı.

gulpfile.js oluşturuldu ve konfigüre edildi.

.bowerrc oluşturuldu." > ./readme.md
    ### / readme dosyası oluşturuldu

    gulp
fi;
