FROM python:3.9-alpine

WORKDIR /app

COPY services/app2/src/ .

RUN pip install Flask

EXPOSE 8082

CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8082"]