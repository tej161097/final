#Acquiring Python 3.11
FROM python:3.8.19-slim-bullseye


#Make app folder on root
RUN mkdir -p /app

#Set working directory for application
WORKDIR /app

#Copy installation direction file and perform packages installation
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

#Copy application to working directoy
COPY *.py ./
COPY Procfile ./

#Run app with gunicorn 
CMD ["gunicorn",  "-b", "0.0.0.0:3000", "app:app"]

EXPOSE 5000
