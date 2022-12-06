# Null Biter Mini Network

## What is in it?
- A Ruby Web App
- A Internal Postgres (Internal IP: 10.10.10.10)

## How it works
The main application (The Ruby Web App) will make API calls to it's internal API.

To the Postgres Server it will check if the file has been updated.

If the file has a DB entry of 0 process time the api will run the algo.

The path in storage is passed to the algo all done in ruby

## Current Working Things
- Apply better file checking to the algorithm.
- Fix Inconsistent File Processing
- Add List to manually Switch Document
- Better Algorithm

## Currently Included
- Web App integration with DB

## Deployment
To startup the app run:
`docker-compose up`

If edits have been done a rebuild is needed. To do so run:
`docker-compose up --build`
