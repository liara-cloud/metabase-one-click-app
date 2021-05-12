ARG VERSION

FROM metabase/metabase:${VERSION}

COPY ./run_metabase.sh /app

RUN chmod +x /app/run_metabase.sh && \
  apk add bash
