FROM python:stretch

# allow the secret to be passed in during build using "... --build-arg JWT_SECRET_ARG=XXXX ..."
ARG JWT_SECRET_ARG

# persist a JWT_SECRET env variable in the image with the value passed through JWT_SECRET_ARG
ENV JWT_SECRET=$JWT_SECRET_ARG

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
