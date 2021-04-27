Build app container:

```sh
docker build -t awakening-hometask .
```

Run the server:
```sh
docker run --name awakening --rm --network host -ti awakening-hometask
```
