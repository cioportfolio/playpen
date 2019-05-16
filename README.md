# Simple prototyping sandbox
A very basic sandbox for getting started developing simple web apps. It is designed to give beginners the satisfaction of creating an interactive website very quickly.

## Getting your computer ready
You will need to install some basic utilities which you can easily find on the web. Use the links and pick the versions for your operating system (Windows or Mac).

Download and install `git` which is a utility to help keep track of your web app files. If you have a Mac you can got to the app store and install `xcode` which includes `git` and a lot of other tools.

```
https://git-scm.com/downloads
```

Download and install `VirtualBox` which is a utility for a sandbox so that your coding mistakes don't mess up your precious laptop or home computer

```
https://www.virtualbox.org/wiki/Downloads
```

Download and install `Vagrant` which is a utility which does a load of hard work to configure the sandbox for your app.

```
https://www.vagrantup.com/downloads.html
```

You can do all of your coding in a text editor but there are some utilities which can do clever things like format your code, spot errors etc. Microsoft's editor is really good and works on Macs too.

```
https://code.visualstudio.com/download
```

## Using the command line
You will need to use your computers command line a little. On Windows type `cmd` into the search box to get to the command line. On Mac you can start the `terminal` app from the launcher or the applications folder. The VSCode editor has a built in terminal which you can use if you prefer.

Your favourite search engine will help you find lists of commands and explain error messages and how to fix anything that goes wrong.

## Setting up the sandbox

Start up your command line and type in this command to download a copy of the sandbox software:

```
git clone git@github.com:cioportfolio/node-postgres.git myapp
```

Typing `dir` (or `ls` on a Mac) will show a list of your folder and you will see a new `myapp` folder there. Move to that folder by typing:

```
cd myapp
```

Typing `dir` (or `ls`) will reveal a load of files for the sandbox. We will explain what these are later. For now let's get the sandbox going.

Type the following command:

```
vagrant up
```

This command is **magic**! Vagrant will start up a virtual machine, download and install all the software it needs and run a simple web server. You will see a load of obscure messages scroll through your command line window. You can ignore these if everything works (and if something goes wrong the explanation will be in this log somewhere).

Once Vagrant has done its work you should see:

```
    default: Starting server
    default: App running on port 3000.
```

Now go to a browser and in the address bar type:

```
localhost:3000
```

You should see a very ugly web page like this:

>
> # Hello world
> ## Data
>[ { "id": 1, "notes": "Test message" } ]

Congratulations! The sandbox is running and you can use it to develop your apps.

## Basic Controls

You have already seen what `vagrant up` can do. Here are a few more basic commands.

`vagrant halt` will shutdown the sandbox so that it doesn't slow down your machine or drain the battery.

`vagrant destroy` will shutdown and delete the sandbox. You might want to do this if you mess something up and want to reset the sandbox.

After these commands `vagrant up` will get things going again. It will know if you have halted or destroyed the sandbox and do the minimum it needs to get running again.

`vagrant ssh` will log you into the sandbox and start its command line so you can run other commands. The sandbox is actually a unix computer running inside you laptop. You can find out how to use it on the web.

## Sandbox content

Any files you want to be part of your website can go in the `public` folder. E.g. if you follow some online guides and create a `test.html` webpage you can put it into the `public` folder and see it in your browser with:

```
localhost:3000/test.html
```

By default the sandbox will display `index.html` which is how you got to the ugly test page. You can play around with `index.html` to see how `html`, `css`, `javascript` and other web technologies work.

`bootstrap.sh` is a unix script which does most of the hardwork when you ran `vagrant up` for the first time. Changing this is probably not for beginners!

`server.js` 