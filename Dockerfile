FROM ubuntu:14.04

RUN apt-get update

#browser is firefox
RUN apt-get install -y python-pip python-dev gcc phantomjs firefox

# automation framerwork is Robot
RUN pip install robotframework
RUN pip install robotframework-selenium2library

# get the test scripts
#RUN git clone ssh://<USER>@<GIT_REPO>/<PATH>

# Add test scripts
ADD /Tests /usr/local/Tests

# run the robot scripts
ADD run_smoke.sh /usr/local/bin/run_smoke.sh
RUN chmod +x /usr/local/bin/run_smoke.sh



CMD ["run_smoke.sh"]