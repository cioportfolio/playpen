# An intermediate web development playpen

This is a basic setup for getting started developing simple web apps. It is designed to give beginners the satisfaction of creating an interactive website very quickly. Since it runs inside a set of containers beginners can play around, mess things up and easily reset their playpen. It also makes it relatively easy to move into the cloud when they are ready.

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
docker-compose up -d
```

This command is **magic**! Docker will start up a set of containers, download and install all the software it needs and run a simple web server. You will see a load of obscure messages scroll through your command line window. You can ignore these if everything works (and if something goes wrong the explanation will be in this logs, use `docker-compose logs`).

Once Docker has done its work you should see:

```bash
Starting playpen_admin_1 ... done
Starting playpen_db_1    ... done
Recreating playpen_api_1 ... done
Recreating playpen_web_1 ... done
```

Now go to a browser and in the address bar type:

```bash
localhost:3000
```

You should see a [reactjs](https://reactjs.org) branded web page with some strange data like this:

>[ { "id": 1, "notes": "Test message" } ]

Congratulations! The playpen is running and you can use it to develop your apps.

## Playpen content

This is an overview of what is in the playpen and what you can do with it. The components are amongst the most popular internet tools so you will find extensive user guides, online training, example code and plenty of help online.

### "web" folder

Any files you want to be part of your website can go in the `app/public` folder. You can use this folder to see how `html`, `css`, `javascript` and other web technologies work. You can find some things to try in [this beginners guide](https://cioportfolio.github.io/gettingstarted/).

If you follow some online guides and create a new webpage e.g `test.html` you can put it into the `app/public` folder and see it in your browser with:

```bash
docker-compose up -d -no-deps --build web
localhost:3000/test.html
```

### React framework

The playpen includes a web application called React and uses this to generate the basic starter page you have seen. You can do a lot with basic web tools but React is a good next step for interactive web sites. React originated inside Facebook but is now free to use and there are loads of online help, tutorials and add ons when you need them. You will find the React code in the `app` folder within the `public` and `src` subfolders. Most of this code was generated using the [create-react-app](https://github.com/facebook/create-react-app#create-react-app--) tool.

To see the impact of any changes you can recreate the web container with

```bash
docker-compose up -d -no-deps --build web
```

If you have made some mistakes you will see some error messages which you can investigate using your favourite search engine. Once the build has finished you can start the playpen again to see the results.

### Express framework

The playpen includes a simple api server framework called express. There are lots of different server frameworks around but the advantage of express is that it uses the same javascript language as your web pages. You will find all of the express configuration in `api/src/server.js`. You can change `server.js` to handle api requests or generate webpages. `server.js` includes one simple api and `app/src/App.js` has a line of code to call it. You can also change `server.js` to add ready-made express components for all sort of things such as handling user data, signing in to account and encryption.

To see the impact of any changes just recreate the api container with

```bash
docker-compose up -d -no-deps --build api
```

### PostgreSQL database

The playpen also includes the PostgresSQL database. `api/src/queries.js` includes an example of accessing the database which is used by the api in `api/src/server.js`. Online help is available to show you how to add new data into the database and access it through javascript using the [pg](https://node-postgres.com/) library.

You can back up the database with:

```bash
docker-compose exec db export
```

This will save the current data in `db/data/dbexport.sql` and use it instead of the original template to load the database if you need to rebuild the playpen.

You can load the backup from the export file with:

```bash
docker-compose exec db import
```

You can edit the back up first to import new data and data structures.

The playpen includes an admin tool which you can reach through your browser at

```bash
localhost:8080
```

Most of the details you need to connect to the database are at the top of `queries.js` but the password is in the `.env` file in the main playpen folder

### Nginx web server

I have also included a professional grade web server, nginx. The main reason to include nginx is to make it easier migrate playpen projects into a data centre or onto the cloud so you probably don't need to do much with it to start with. The configuration file is `app/nginx.conf`

### Docker configuration

Several `Dockerfile` and `docker-compose.yml` files provides the basic information which Docker uses to build the playpen, such as what operating system to use and what scripts to run. The Docker website provides lots of instructions and how-tos. For example, you can use Docker to deploy your web app onto a cloud service such as Amazon AWS or Microsoft Azure.
