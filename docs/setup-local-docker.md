##### Build the Docker images:

```poweshell
  docker-compose build
```

##### Run Migrations:

```poweshell
  docker-compose run web rake db:migrate
```

##### Seed Data

```poweshell
docker-compose run web rake import:movies
```

##### Start the containers:

```poweshell
docker-compose up
```

##### For detached mode:
```poweshell
```
##### Check the status of the containers:

```poweshell
```

##### View logs:
```poweshell
docker-compose logs
```

###### Stop the containers:
```poweshell
docker-compose down
```

###### To also remove data volumes:

```poweshell
docker-compose down -v
```
