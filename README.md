# An intermediate web development playpen
This is a basic setup for getting started developing simple web apps. It is designed to give beginners the satisfaction of creating an interactive website very quickly. Since it runs inside a virtual machine beginners can play around, mess things up and easily reset their playpen. It also makes it realatively easy to move into the cloud when they are ready.

If you want to try something even easier to get started have a look at [this beginners guide](https://cioportfolio.github.io/gettingstarted/).

## Getting your computer ready
You will need to install some basic utilities which you can easily find on the web. Follow [these instructions](https://cioportfolio.github.io/gettingstarted/pcsetup#getting-your-computer-ready) for more details. You will only need to do this once on each machine that you work on. There are also some [instructions on using your computer's command line](https://cioportfolio.github.io/gettingstarted/pcsetup#using-the-command-line).

## Setting up the playpen

Start up your command line and type in this command to download a copy of the playpen software:

```
git clone https://github.com/cioportfolio/playpen.git myapp  --config core.autocrlf=false
```

This will create a new `myapp` folder with all the playpen software. Move to that folder by typing:

```
cd myapp
```

Typing `dir` (or `ls`) will reveal a load of files for the playpen. We will explain what these are later. For now let's get the playpen going.

Type the following command:

```
vagrant up
```

This command is **magic**! Vagrant will start up a virtual machine, download and install all the software it needs and run a simple web server. You will see a load of obscure messages scroll through your command line window. You can ignore these if everything works (and if something goes wrong the explanation will be in this log somewhere).

Once Vagrant has done its work you should see:

```
    default: Server started
```

Now go to a browser and in the address bar type:

```
localhost:8080
```

You should see a [reactjs](https://reactjs.org) branded web page with some strange data like this:

>[ { "id": 1, "notes": "Test message" } ]

Congratulations! The playpen is running and you can use it to develop your apps.

# Playpen content

This is an overview of what is in the playpen and what you can do with it. The components are amongst the most popular internet tools so you will find extensive user guides, online training, example code and plenty of help online.

## "build" subfolder

Any files you want to be part of your website can go in the `build` folder. By default the playpen will display `index.html` which is how you got to the simple test page. You can change or replace `index.html` to see how `html`, `css`, `javascript` and other web technologies work. You can find some things to try in [this beginners guide](https://cioportfolio.github.io/gettingstarted/).

If you follow some online guides and create a new webpage e.g `test.html` you can put it into the `build` folder and see it in your browser with:

```
localhost:8080/test.html
```

## React framework
The playpen includes a web application called React and uses this to generate the basic starter page you have seen. You can do alot with basic web tools but React is a good next step for interactive web sites. React originated inside Facebook but is now free to use and there are loads of online help, tutorials and add ons when you need them. You will find the React code in the `public` and `src` folders. Most of this code was generated using the [create-react-app](https://github.com/facebook/create-react-app#create-react-app--) tool. Once you have made changes you will need to rebuild your app with the commands below. **WARNING**: This command will replace everying in the `build` folder.

First go to your command line and log into the playpen virtual machine

```
vagrant ssh
```

You will get a new prompt to show you are working in the virtual machine. Then:

```
npm run build
```

If you have made some mistakes you will see some error messages which you can investigate using your favourite search engine. Once the build has finished you can:

```
exit
```

## Express framework

The playpen includes a simple api server framework called express. There are lots of different server frameworks around but the advantage of express is that it uses the same javascript language as your web pages. You will find all of the express configuration in `src/server/server.js`. You can change `server.js` to handle api requests or generate webpages. `server.js` includes one simple api and `src/App.js` has a line of code to call it. You can also change `server.js` to add ready-made express components for all sort of things such as handling user data, signing in to account and encryption. The playpen uses a utility call [pm2](https://pm2.keymetrics.io/docs/usage/quick-start/) to manage the api server so when you have made changes you can restart the server by logging into the virtual machine (see instructions in the React section above) and then use:

```
pm2 restart api
```

## PostgreSQL dababase

The playpen also includes the PostgresSQL database. `src/server/queries.js` includes an example of accessing the database which is used by the example api in `src/server/server.js`. Online help is available to show you how to add new data into the database and access it through javascript. The details you need to connect to the database are at the top of `queries.js`.

You can use a tool like pgadmin (see optional utilities earlier in this guide) to add new dabase tables and manage the data.

Each time you use vagrant to stop the playpen (e.g. `vagrant halt`) the database will exported to `dbexport.pgsql`. If you reset the playpen (e.g. `vagrant destroy`) the database will be reloaded from this export.

## Nginx web server

I have also included a professional grade web server, nginx. The main reason to include nginx is to make it easier migrate playpen projects into a data centre or onto the cloud so you probably don't need to do much with it to start with.

## Vagrant configuration

`provisionserv.sh` and `provisiondb.sh` are unix scripts which do most of the hardwork when you ran `vagrant up` for the first time. Changing these are probably not for beginners but the vagrant website includes extensive how-to guides. You can change the scripts and rebuild the playpen with additional software or different components e.g. different databases and server frameworks. These scripts can also be used to set up a server in a data centre or in the cloud by running `provisionall.sh`.

`Vagrantfile` provides the basic information which vagrant uses to build the playpen, such as what operating system to use and what scripts to run. The vagrant website provides lots of instructions and how-tos. For example, you can get vagrant to deploy your web app onto a cloud service such as Amazon AWS or Microsoft Azure.

`dbexport.sh` is a unix script which vagrant uses to backup the database when you stop the playpen.
