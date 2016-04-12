# Atom-SassAutocompile-MultiProjectPatch

This is a patch for this Atom package: https://atom.io/packages/sass-autocompile
The package is great, but currently there is no support for different folder structure in different parallel projects.
The patch is made because I tired to change the "Filename pattern for 'compact' output style" setting all the time when I switch between projects, and if I use deeper folders (e.g.: sass/registration/index.scss => css/registration/index.scss) inside one of my project, need to change the setting for every file!
The file location in Mac OSX: ~/.atom/packages/sass-autocompile/lib/compiler.coffee
The only modification made in "getOutputFile" function
