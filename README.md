# README

Job announcements on Twitter are ephemeral. This app allows the discovery and basic filtering of tweets that contain job postings.

# Environment variables

Example `.env` file:
```
POSTGRES_PASSWORD=

# Twitter (you can get these when you create your app https://apps.twitter.com/)
CONSUMER_KEY=
CONSUMER_SECRET=
ACCESS_TOKEN=
ACCESS_SECRET=

# Search options (these default to a 10 mile radius from Cardiff Castle)
DEFAULT_RADIUS_IN_MILES = 10
DEFAULT_LATITUDE = 51.4882023
DEFAULT_LONGITUDE = -3.1638941
```

# Running the app

Provided you have `docker-compose` installed and all the required environment variables, you can start the app with:

```
docker-compose build && docker-compose up
```