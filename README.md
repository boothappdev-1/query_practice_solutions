# Query Practice

## Introduction

This application is a reference for movie buffs. We maintain a list of the top ~100 movies of all time, along with the directors and actors associated with each movie.

Our domain model is as follows:

    Movie:
      title: string
      year: string
      duration: integer
      description: text
      image_url: string
      director_id: integer

    Director:
      dob: string
      name: string
      bio: text
      image_url: string

    Actor:
      dob: string
      name: string
      bio: text
      image_url: string

    Role:
      character_name: string
      movie_id: integer
      actor_id: integer

Currently, we have standard CRUD resources that work, but the interface of this app is not very helpful.

Let's display information in a more helpful way for our users -- for example, rather than only displaying all of the actors together in one list at http://localhost:3000/actors, lets display a cast on the show page of each movie.

## Setup

 1. Clone this repository.
 1. `cd` into the application's root folder.
 1. `bundle install`
 1. `rake db:migrate`
 1. `rake db:seed`
 1. `rails s`

Navigate to http://localhost:3000 and click around to familiarize yourself with the application. I've provided some seed data for you so that you can get straight to work.

## Part 1

First of all, our users should never have to see ID numbers. Right now, the following views display raw IDs:

 - movies#show (displays director_id)
 - movies#index (displays director_id)
 - roles#show (displays movie_id and actor_id)
 - roles#index (displays movie_id and actor_id)

Go through and improve each of these views to display names or titles rather than IDs. In other words, take an ID number and use it to look up the row in the corresponding table, and then peel off something more helpful like a name or title.

## Part 2

Let's now make the app more useful by displaying collections of objects that belong to single objects:

 - On the directors#show page, display a filmography (list of movies that belong to that director)
 - On the movies#show page, display a cast (list of characters (and actor for each) that belong to that movie)
 - On the actors#show page, display a filmography (list of characters (and movie for each) that the actor has played)

## Part 3

Wherever possible, convert actor/director names or movie titles in to links that take you to the show page for that resource.

## Part 4

There is a new link on the navbar: Questions. Check it out. Follow the RCAV for each question and answer it in the action. Practice querying your tables to answer useful questions. Be sure to answer Questions 1-6, but only work on questions 7-9 if you finish all your other work and are bored.
