Build the container:

```sh
docker build -t awakening-hometask .
```

Run the server:
```sh
docker run --name awakening --rm --network host -ti awakening-hometask
```

The test server publishes utterances to the `utterance` ROS topic in a loop.

Tasks:
- write a Python script which subscribes to the `utterance` ROS topic; you may
  use the docker image above to get the environment for work
- for each received utterance parse it using `amrlib`, print resulting graphs
- use each AMR graph to generate a sentence and print this sentence
- does the generated sentence equal to the original one?
- create a separate Dockerfile for the subscriber script you created; you can use the docker
  image above as a parent image; the client should be started automatically when
  the container is started using `docker run` command
- write a function with two arguments: a question and a word; the function
  should do the following:
  - parse the given question to the AMR graph
  - replace `amr-unknown` in the resulting AMR graph by the given word
  - generate and return a new sentence using a modified graph
- write a unit test which shows that your function works; you can use one of
  the questions from example
- how has the question changed?
- are there questions which don't contain `amr-unknown` instance?

Links:
- [amrlib library](https://github.com/bjascob/amrlib)
- [AMR specification](https://github.com/amrisi/amr-guidelines/blob/master/amr.md)
- [spacy library](https://spacy.io/)
- [penman treei library](https://github.com/goodmami/penman)
- [ROS wiki](http://wiki.ros.org/)
- [rospy library](http://wiki.ros.org/rospy)
