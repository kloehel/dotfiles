README
------

To automatically install everything, just execute the install.sh script.
Take a look at this script since it might perform some actions that are
not of your satisfaction. Anyways, by default this script takes care of
initializing and updating submodules (in my case, I keep the vundle repo as
a submodule). Nonetheless, this script won't install the plugins for you. In
order to do so remember to type the following inside vim:

    :BundleInstall

And that's about it. Use this at your own risk ;)
