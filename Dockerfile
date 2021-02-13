FROM runmymind/docker-android-sdk:latest

# Installing build tools
RUN apt-get update && \
  apt-get install -y \
  build-essential \
  ruby \
  ruby-dev

# Installing bundle
RUN gem install bundle

# Installing fastlane
RUN gem install fastlane

# Install stable nodejs, ionic & cordova
RUN npm install -g n && n stable
RUN npm install -g @ionic/cli cordova

# Install gradle
RUN wget https://services.gradle.org/distributions/gradle-4.6-bin.zip
RUN mkdir /opt/gradle
RUN unzip -d /opt/gradle gradle-4.6-bin.zip
RUN export PATH=$PATH:/opt/gradle/gradle-4.6/bin
ENV PATH=$PATH:/opt/gradle/gradle-4.6/bin

# Work directory
WORKDIR /app
