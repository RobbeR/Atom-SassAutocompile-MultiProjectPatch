# Atom-SassAutocompile-MultiProjectPatch

This is a patch for this Atom package: https://atom.io/packages/sass-autocompile<br /><br />
The package is great, but currently there is no support for different folder structure in different parallel projects.<br />
The patch is made because I tired to change the "Filename pattern for 'compact' output style" setting all the time when I switch between projects, and if I use deeper folders (e.g.: sass/registration/index.scss => css/registration/index.scss) inside one of my project, need to change the setting for every file<br /><br />
The file location in Mac OSX: ~/.atom/packages/sass-autocompile/lib/compiler.coffee<br /><br />
The only modification made in "getOutputFile" function<br /><br />

Once you patched the package, you can use multiple folder mapping like this:<br />
Filename pattern for 'compact' output style: <br />
/project1/path/sass/:/project1/path/css/;/project2/path/sass/:/project2/path/css/
