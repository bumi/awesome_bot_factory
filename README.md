# AWESOMEBOTFACTORY! - Super charge your campfire chatrooms with a whole catalog of awesome bots!


## What's the Awesomebotfactory?

The awesomebotfactory.com is the factory for skilled bots that hang out
in your campfire chatroom. They are there to support you, make you smile and in general do
whatever you want. - what bots are for, right?
There is already a growing catalog of skills on the awesomebotfactory available
and with this gem you can easily develop your own and teach your bot new
tricks.


## What is this Gem?

A skill for the awesomebotfactory is basicly any web application that
accepts a POST request with details about a matched campfire message
and returns a simple JSON with the content that should be replied into
the chat room. This gem makes it super easy to develop and deploy such
an application. It gives you the basic structure of an application and
the tools to deploy it to heroku.

## How to develop new skills

Developing new skills for your campfire bot is super easy.

1. create a new application
2. hack,hack,hack
3. deploy
4. register and activate the new skill - and done!

### create

    gem install awesome_bot_factory

    awesomebotfactory create DemoSkill

this creates a new directory demo_skill with all the needed files.
open the directory and adjust the demo_skill.rb for your liking. All is
allowed it only has to respond to reply and return a JSON with a "body"
which is the message to be replied and a "type" with the type of message
you want to reply (see campfire api for options)

### deploy

you can deploy anywhere you want but free deployment to heroku is
included.
so just do

    awesomebotfactory deploy

This creates an application on heroku, prepares your git repository if needed and pushes the code to heroku. In our case the application will be available on http://abf-demo-skill.herokuapp.com/demo_skill

### register

After we have deployed the skill we have to tell the
awesomebotfactory.com about it. Currently there is no command for this
yet so we go to awesomebotfactory.com/skills/new enter our details and
activate the skill for our bot.

### DONE

now for every campfire message that matches the registered regex your
application will be requested for a reply.
Easy as that! try it!

## Screencast

coming soon

## Help

If you have any questions let me know michael@railslove.om




