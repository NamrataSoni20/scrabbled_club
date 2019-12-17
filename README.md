# README

A scrabble club requires a system to store members’ information and provide
leader boards to show their top performing players. For members we would
want to store information such as the date they joined the club and their
contact details.
All recorded scrabble games are head to head matches between 2 players, the
player with the highest score at the end of the game wins.

Please run following commands to run this application:

1. bundle install
2. rake db:create & rake db:migrate
3. rails s [development environment]


At the end you must prepare a document that will have the following things
mentioned:
1. Remaining functionality (if any)

-> User Module
-> Reports
-> Game can involve more than 2 players
-> Scope of Game and Pleayers

2. Which type of problem(s) you’ve faced during the test? (if any)
-> I have used Rails 6 and then got issue with webpacker with bootstrap so I made this application in Rails 5.2.3
3. Steps that needs to be executed before running your application (if you have
used some gems or other libraries).
-> Mentioned in Redme file of git
    1. bundle install
    2. rake db:create & rake db:migrate
    3. rails s [development environment]

4. Prepare a release note of the features you implemented
-> This application at its initial face.
-> In this release we have covered following features
   1. Game module
   2. Players module
