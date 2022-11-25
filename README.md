# Null Biter Mini Network

## What is in it?
- A Ruby Web App
- A Internal FTP Server (Internal IP: 10.10.10.30)
- A Internal Postgres (Internal IP: 10.10.10.10)

## How it works
The main application (The Ruby Web App) will make API calls to it's internal API.

This internal API will make a request to the FTP server and the Postgres server.

To the FTP Server it will grab the desired file.

To the Postgres Server it will check if the file has been updated.

If the file has a DB entry of 0 process time the api will run the algo.

***TO BE CHANGED*** It will run the algo, set the process time to 1, and update the file on the FTP Server.

## Current Working Things
- Setup active storage with FTP https://github.com/gordienko/activestorage-ftp
- Figure out the issue with PSPDFKIT.
- Apply better file checking to the algorithm.

## Currently Included
- Web App integration with DB and File Server.
- API for JS to use.

## Deployment
To startup the app run:
`docker-compose up`

If edits have been done a rebuild is needed. To do so run:
`docker-compose up --build`
