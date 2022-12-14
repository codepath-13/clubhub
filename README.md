# ClubHub

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)
3. [Video Walkthrough](#Video-Walkthrough)

## Overview
### Description
An app where users can view and join different clubs/organizations that their university offers. Makes joinning clubs very simple.

### App Evaluation
- **Category:** Social/Education
- **Mobile:** Mainly a mobile app although could be viable on a computer.
- **Story:** Provides a way to connect students to different clubs in their university.
- **Market:** College Students
- **Habit:** This app can be used as often as people want and/or need to in order to find desired clubs.
- **Scope:** Starting out we will show different clubs and their information and allow for a chat option for people in the club.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User logs in to access their clubs
- [x] User can browse throug explore page to find clubs
- [x] Each club has a home page
- [x] User can make a club
- [x] User can access their preference settings
- [x] User can browse through a homepage with all of their clubs


### 2. Screen Archetypes

* Login
* Register
   * When closing the application, app remembers if user is logged in
* Home screen
   * A view of the clubs that the account logged in is part of
* Explore Screen
   * A view of the clubs that the user is not a part of
* Club Screen
   * A screen with the clubs picture, name, description, and chat
* Profile Screen
   * A screen where users can view and update their profile

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Explore
* Profile

**Flow Navigation** (Screen to Screen)

* Forced Log-in -> Account creation if no log in is available
* Home screen -> club screen
* Explore screen -> club screen

## Wireframes
<img src="https://github.com/codepath-13/clubhub/blob/main/ClubHub%20Wireframes%20(Updated).jpg" width=600>


## Schema 

### Models

Club

|Property|Type|Description|
|--------|----|-----------|
|ClubID|String|Unique ID for the Club|
|image|file|Image that displays on club pages|
|description|String|Description of club activites|
|School|String|Name of the school this club operates at|
|email|String|Club email|
|members|Array|An array with the clubs members|

USER

|Property|Type|Description|
|--------|----|-----------|
|username|String|Unique ID for each User|
|password|String|Password for user|
|profileImage|file|User's profile picture|
|Bio|String|User's short description about themselves|
|School|String|Name of the school this student attends|
|clubs|Array|An array with the users joined clubs|



### Networking

* Home Screen
  * (Read/GET) Query all joined clubs
* Explore Screen
  * (Read/GET) Query all available clubs at the given school
* Profile Screen
  * (Read/GET) Query logged in user object



### Video Walkthrough

Here's a walkthrough of implemented user stories of Week 3:

<img src='http://g.recordit.co/CQWNFWSlS8.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


Here's a walkthrough of Week 2 implemented user stories:

<img src='/clubHub.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/vaucCqahZw.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
