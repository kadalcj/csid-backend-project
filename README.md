# CSID Backend Project
## Create Postgres and PG Admin on Docker
```$bash
docker-compose up -d
```

## Restore Database
I've backup the Database of mine. It was on the root folder, named `backup.sql`

## To Run
```$bash
# If restore data hasn't been done
npm run migrate

# Run App
npm run dev
```

## Import Postman Collection
There's Postman Collection file inside folder `./postman/CSID.postman_collection.json`