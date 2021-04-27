Build container:

```sh
docker build -t awakening-hometask .
```

Run the server:
```sh
docker run --name awakening --rm --network host -ti awakening-hometask
```

Test server publishes utterances to the `utterance` ROS topic in a loop.

Tasks:
- write a Python script which subscribes to the `utterance` ROS topic; you may
  use docker image above to get environment for work
- for each received utterance parse it using `amrlib`, print resulting graphs
- use each AMR graph to generate a sentence and print this sentence
- does generated sentence equal to the original one?
- create a Dockerfile for the subscriber script you created; you can use docker
  image above as a parent image; client should be started automatically when
  container is started using `docker run` command
- write a function with two arguments: a question and a word; function
  should do the following:
  - parse the given question to the AMR graph
  - replace `amr-unknown` in the resulting AMR graph by the given word
  - generate and return new sentence using modified graph
- write a unit test which shows that your function works; you can use one of
  the questions from example
- how does the question changed?
- are there questions which doesn't contain `amr-unknown` instance?

Links:
- [amrlib library](https://github.com/bjascob/amrlib)
- [AMR specification](https://github.com/amrisi/amr-guidelines/blob/master/amr.md)
- [spacy library](https://spacy.io/)
- [penman treei library](https://github.com/goodmami/penman)
- [ROS wiki](http://wiki.ros.org/)
- [rospy library](http://wiki.ros.org/rospy)
