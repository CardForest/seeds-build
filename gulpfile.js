//make sure gulp is run from the current directory
process.chdir(__dirname);
// just make sure we have coffeescript registered and run the gulpfile
require('coffee-script/register');
require('./gulpfile.coffee');