# ReactJS Messaging App

## Objectives

Create a MVC application with Ruby on Rails that allows a user to:

1. View their contact list.
2. Select a contact.
3. Send that contact a message.

## Instructions

This application is configured to run with PostgreSQL.  As with any Rails app, make sure to run 'bundle install' from the command line, then start the Rails server.  The webpage will then be available at localhost:3000.

Contacts will be displayed upon arriving at the webpage.  Contacts can be clicked on to select them.  In order to send a contact a message, ensure that the desired contact is selected, then click the blue button below the phone screen.

This first click will open up the message field.  After typing your message, click the same blue button again to send the message.  The application will notify you whether the POST request has been successful or not, and then will return you to the contact list.

## Approach & Functionality

Since all requests for server-side data are being made externally, rather than to a database that is connected with this Rails framework, all API requests are made via the HTTParty gem.

The API token required to make the external requests is stored in an environmental variable, with the enclosing file being included in the project's .gitignore, which ensures that it is not exposed to prying eyes.

When requests are made to this Rails application, they hit the controller, which has access to HTTParty objects.  These objects use parameters delivered via the Rails routes to then make subsequent requests and receive corresponding data from an external API.

In this fashion, the HTTParty objects conceptually undertake the role of models that we would see in a traditional application of MVC architecture.

Upon arriving to the webpage, a contacts list is requested and supplied from an external API.  It is then set as an instance variable, so that the corresponding view has access to that data, which is then rendered accordingly into HTML elements.

Each rendered contact element has a click handler attached via jQuery that uses the respective contact's ID number to make a POST request with the desired message the user wishes to send.

## Style

While Rails is reliable and easy to use, it is a tad older than some of the fancy SPA frameworks like React and Angular that are seeing increased use today.  For that reason, the UI has been styled after a Nokia 3310 cellphone.  Elements have been absolutely positioned to emulate a cellphone screen, and a button on the phone itself serves to help users interact with the application.
