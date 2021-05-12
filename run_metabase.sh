#!/bin/bash

rm -rf /tmp/*

# if nobody manually set a host to listen on then go with all available interfaces and host names
if [ -z "$MB_JETTY_HOST" ]; then
    export MB_JETTY_HOST=0.0.0.0
fi

# Setup Java Options
JAVA_OPTS="${JAVA_OPTS} -XX:+IgnoreUnrecognizedVMOptions"
JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=UTF-8"
JAVA_OPTS="${JAVA_OPTS} -Dlogfile.path=target/log"
JAVA_OPTS="${JAVA_OPTS} -XX:+CrashOnOutOfMemoryError"
JAVA_OPTS="${JAVA_OPTS} -server"

if [ ! -z "$JAVA_TIMEZONE" ]; then
    JAVA_OPTS="${JAVA_OPTS} -Duser.timezone=${JAVA_TIMEZONE}"
fi

exec /bin/sh -c "exec java $JAVA_OPTS -jar /app/metabase.jar $@"
