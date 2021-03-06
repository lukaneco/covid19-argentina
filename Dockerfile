# set base image (host OS)
FROM python:3.8-slim
# set the working directory in the container
WORKDIR /app
# copy the dependencies file to the working directory
COPY requirements.txt .
# install dependencies
RUN pip install -r requirements.txt
#RUN pip install --no-cache-dir -r requirements.txt
# copy the content of the local src directory to the working directory
COPY main.py .
ENTRYPOINT ["python"]
CMD ["main.py"]

# FROM python:3.7-alpine as base
# FROM base as builder
# RUN mkdir /install
# WORKDIR /install
# COPY requirements.txt /requirements.txt
# RUN pip install --install-option="--prefix=/install" -r /requirements.txt
# FROM base
# COPY --from=builder /install /usr/local
# #COPY src /app
# COPY main.py /app
# WORKDIR /app
# CMD ["gunicorn", "-w 4", "main:app"]