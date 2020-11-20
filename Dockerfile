ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN apk add --no-cache python3 python3-dev musl-dev gcc && \
    python3 -m ensurepip && \
    pip3 install -U pip
RUN pip3 install -r /app/requirements.txt

COPY hassos /app/hassos
COPY edamodbusbridge /app/edamodbusbridge
RUN chmod +x /app/hassos/entrypoint.sh

CMD ["/app/hassos/entrypoint.sh"]