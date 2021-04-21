FROM singnet/opencog-dev:cli

# Set up amrlib
RUN apt-get update && apt-get install -y python3-pip wget
RUN pip3 install -r https://github.com/bjascob/amrlib/raw/master/requirements.txt
RUN pip3 install amrlib sentencepiece
RUN python3 -m spacy download en_core_web_sm
RUN python3 -m spacy download en_core_web_md
ARG AMRLIB_DATA=/usr/local/lib/python3.8/dist-packages/amrlib/data
RUN mkdir $AMRLIB_DATA
RUN wget https://github.com/bjascob/amrlib-models/releases/download/model_parse_t5-v0_1_0/model_parse_t5-v0_1_0.tar.gz -P /tmp \
  && tar -xzf /tmp/model_parse_t5-v0_1_0.tar.gz -C $AMRLIB_DATA \
  && mv $AMRLIB_DATA/model_parse_t5-v0_1_0 $AMRLIB_DATA/model_stog
RUN wget https://github.com/bjascob/amrlib-models/releases/download/model_generate_t5wtense-v0_1_0/model_generate_t5wtense-v0_1_0.tar.gz -P /tmp \
  && tar -xzf /tmp/model_generate_t5wtense-v0_1_0.tar.gz -C $AMRLIB_DATA \
  && mv $AMRLIB_DATA/model_generate_t5wtense-v0_1_0 $AMRLIB_DATA/model_gtos
RUN python3 -c "import amrlib ; amrlib.load_gtos_model() ; amrlib.load_stog_model()"

# Setup ros
ARG ROS_VERSION=noetic
ENV ROS_DISTRO $ROS_VERSION

RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" \
    > /etc/apt/sources.list.d/ros-latest.list \
  && wget -O- https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
  && apt-get update \
  && apt-get install -y --no-install-recommends ros-$ROS_DISTRO-ros-base \
    ros-$ROS_DISTRO-rosbridge-suite ros-$ROS_DISTRO-roslaunch \
  && pip3 install rospkg \
  && echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc \
  && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/osrf/docker_images/master/ros/$ROS_DISTRO/ubuntu/focal/ros-core/ros_entrypoint.sh /
RUN chmod +x /ros_entrypoint.sh

# Set up the app
COPY . /app/
WORKDIR /app

ENV PYTHONPATH "${PYTHONPATH}:/app"

# Cleanup
RUN rm -rf /tmp/*
