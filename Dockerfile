FROM python:3.12-slim

WORKDIR /app
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN opentelemetry-bootstrap -a install

COPY src/app.py .

ENV OTEL_SERVICE_NAME=ousmane-toure-monapp
ENV OTEL_TRACES_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://192.168.1.22	:4318
ENV OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf
ENV OTEL_METRICS_EXPORTER=none
ENV OTEL_LOGS_EXPORTER=none

EXPOSE 5000
CMD ["opentelemetry-instrument", "python", "app.py"]