# electron build image

Image for building crossplatform (win, ios, linux) apps on Linux CI

## Usage (Gitlab CI example)

### .gitlab.ci.yml

```yml
image: atnartur/electron-build:latest

stages:
  - build

build:
  stage: build
  script:
    - npm i
    - gulp build
```

### gulpfile.js

```
const gulp = require('gulp');
const packager = require('electron-packager');
const gutil = require('gulp-util');
const packageJson = require('package.json');

gulp.task('build', (done) => {
    packager({
        arch: 'all', // Allowed values: ia32, x64, all
        dir: './cache/app',
        platform: 'all', // Allowed values: linux, win32, darwin, all
        appVersion: packageJson.version,
        cache: './cache',
        name: packageJson.name,
        out: './build',
        electronVersion: '1.6.2', 
        overwrite: true
    }, function (err, appPath) {
        if(err)
            throw err;
        gutil.log(appPath);
        done();
    });
});
```

### npm

`npm i gulp gulp-util electron-packager --save-dev`