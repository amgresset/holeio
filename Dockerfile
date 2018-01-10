FROM python:2.7-alpine

COPY . /holeio
WORKDIR "/holeio"
RUN pip install -r requirements.txt && \
  apk update && apk upgrade && \
  apk add --no-cache bash
RUN python setup.py develop
WORKDIR "/holeio/holeio"
EXPOSE 8000
CMD ["gunicorn","app:app"]
