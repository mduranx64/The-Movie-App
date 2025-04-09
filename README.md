# The-Movie-App

This is an example project using the movie database api
The first screen get a list of movies and you can select one to see its description

open TheMovieApp.xcodeproj file with XCode 11+ and run app and tests
no need to install external libraries 

This app uses MVP UI pattern also others software design pattern like dependency injection with composition root, adapter and more. For testing it use mocked api models and spy test doubles.

contact me for more information.

# 🎬 The Movie App - API Key Configuration Guide

Welcome to **The Movie App**! To fetch movie data from [The Movie Database (TMDb)](https://www.themoviedb.org/), you need to provide your own API key. This guide will walk you through the setup.

---

## 🔑 Step 1: Get Your API Key

1. Go to [https://www.themoviedb.org/](https://www.themoviedb.org/).
2. Create an account (if you don’t have one).
3. Navigate to your [API settings page](https://www.themoviedb.org/settings/api).
4. Fill out the required information and request an API key.
5. Once approved, copy your **API key**.

---

## 🗂 Step 2: Create `Secrets.plist`

In your Xcode project:

1. Right-click the project navigator and choose New File → Property List
2. Name it Secrets.plist
3. Add a new entry:
   - **Key**: `TMDB_API_KEY`
   - **Type**: String
   - **Value**: _Your TMDB API key_ (e.g., `abc123xyz...`)

> ☝️ _Make sure `Secrets.plist` is included in your app target (check the File Inspector on the right panel in Xcode)._
