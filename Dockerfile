FROM ubuntu:22.10

# Adding user
RUN useradd -ms /bin/bash newuser
USER newuser
WORKDIR /home/newuser


RUN apt-get update && apt-get install -y python3.10.5 python3.10.5-dev

COPY . .

RUN pip install -r requirements.txt

CMD ["python"]