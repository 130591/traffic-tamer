FROM python:3.9-alpine

WORKDIR /app

COPY . .

RUN pip install Flask

ENV FLASK_APP=src/main.py

EXPOSE 8082

CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8082"]