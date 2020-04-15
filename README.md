# An intermediate web development playpen

This is a basic setup for getting started developing simple web apps. It is designed to give beginners the satisfaction of creating an interactive website very quickly. Since it runs inside a virtual machine beginners can play around, mess things up and easily reset their playpen. It also makes it realatively easy to move into the cloud when they are ready.

This is intended for people who have already learnt the basics through learning-to-code sites (e.g. [this list of popular sites](https://www.alphr.com/business/1002967/learn-to-code-for-free-UK-courses-apps)) and want to go to the next step.

It will also be useful to be able to use the command line for your PC. There are some good YouTube videos which cover the basics (e.g. [this command line series](https://www.youtube.com/watch?v=MBBWVgE0ewk) which is a little old but very easy to follow).

## Getting your computer ready

You will need to install some basic utilities which you can easily find on the web. You will only need to do this once on each machine that you work on.

First of all download and install Docker Desktop from the [Docker website](https://www.docker.com/products/docker-desktop).

The playpen doesn't actually need any more utilities but these instructions also use [VSCode](https://code.visualstudio.com/) and [git](https://git-scm.com/downloads) to make things easier. Download and install them using the links.

## Downloading the playpen

Start up your command line and type in this command to download a copy of the playpen software:

```bash
git clone https://github.com/cioportfolio/playpen.git myapp  --config core.autocrlf=false
```

This will create a new `myapp` folder with all the playpen software. Make a note of where this folder is so that you can get to them in the next step. Move to that folder by typing:

```bash
cd myapp
```

Typing `dir` (or `ls`) will reveal a load of files for the playpen. We will explain what these are later. For now let's get the playpen going.

Type the following command:

```bash
docker-compose up
```

This command is **magic**! Docker will start up a virtual machine, download and install all the software it needs and run a simple web server. You will see a load of obscure messages scroll through your command line window. You can ignore these if everything works (and if something goes wrong the explanation will be in this log somewhere).

Once Docker has done its work you should see:

```bash
Playpen Started
```

Now go to a browser and in the address bar type:

```bash
localhost:8080
```

You should see a [reactjs](https://reactjs.org) branded web page with some strange data like this:

>[ { "id": 1, "notes": "Test message" } ]

Congratulations! The playpen is running and you can use it to develop your apps.

## Playpen content

This is an overview of what is in the playpen and what you can do with it. The components are amongst the most popular internet tools so you will find extensive user guides, online training, example code and plenty of help online.

### "web" folder

Any files you want to be part of your website can go in the `web/www` folder. You can use this folder to see how `html`, `css`, `javascript` and other web technologies work. You can find some things to try in [this beginners guide](https://cioportfolio.github.io/gettingstarted/).

If you follow some online guides and create a new webpage e.g `test.html` you can put it into the `web/www` folder and see it in your browser with:

```bash
localhost:8080/test.html
```

### React framework

The playpen includes a web application called React and uses this to generate the basic starter page you have seen. You can do alot with basic web tools but React is a good next step for interactive web sites. React originated inside Facebook but is now free to use and there are loads of online help, tutorials and add ons when you need them. You will find the React code in the `app` folder within the `public` and `src` subfolders. Most of this code was generated using the [create-react-app](https://github.com/facebook/create-react-app#create-react-app--) tool. The playpen should automatically pick up any changes you make which you can see by refreshing your bowser. If you have made some mistakes you will see some error messages which you can investigate using your favourite search engine. Once the build has finished you can start the playpen again to see the results.

**Warning** The playpen will look in `web/www` for files first so if you have `index.html` in `web/www` you won't see your react app. Just delete or rename the `www/web` files to see your react app.

### Express framework

The playpen includes a simple api server framework called express. There are lots of different server frameworks around but the advantage of express is that it uses the same javascript language as your web pages. You will find all of the express configuration in `api/src/server.js`. You can change `server.js` to handle api requests or generate webpages. `server.js` includes one simple api and `app/src/App.js` has a line of code to call it. You can also change `server.js` to add ready-made express components for all sort of things such as handling user data, signing in to account and encryption. The playpen uses a utility called [pm2](https://pm2.keymetrics.io/docs/usage/quick-start/) to manage the api server so when you have made changes you can just restart the playpen.

### PostgreSQL dababase

The playpen also includes the PostgresSQL database. `api/src/queries.js` includes an example of accessing the database which is used by the example api in `api/src/server.js`. Online help is available to show you how to add new data into the database and access it through javascript. Most of the details you need to connect to the database are at the top of `queries.js` but the password is generated randomly. To find it for your copy of the playpen use:

```bash
docker-compose run play sudo su - vagrant -c ". ~/dbpass.sh && echo $DBPASS"
```

You can use a tool like pgadmin ([download site](https://www.pgadmin.org/download/)) to add new dabase tables and manage the data.

### Nginx web server

I have also included a professional grade web server, nginx. The main reason to include nginx is to make it easier migrate playpen projects into a data centre or onto the cloud so you probably don't need to do much with it to start with. The configuration file is `web/default`

### Docker configuration

`bin/provisionserv.sh` and `db/provisiondb.sh` are unix scripts which do most of the hardwork when you ran `docker-compose up` for the first time. Changing these are probably not for beginners but the docker website includes extensive how-to guides. You can change the scripts and rebuild the playpen with additional software or different components e.g. different databases and server frameworks. These scripts can also be used to set up a server in a data centre or in the cloud.

`Dockerfile` and `docker-compose.yml` provides the basic information which Docker uses to build the playpen, such as what operating system to use and what scripts to run. The Docker website provides lots of instructions and how-tos. For example, you can use Docker to deploy your web app onto a cloud service such as Amazon AWS or Microsoft Azure.
