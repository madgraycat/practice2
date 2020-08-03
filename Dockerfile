FROM fnndsc/ubuntu-python3
RUN pip install --upgrade pip && apt install -y libpq-dev
COPY ./python-sample-app /application
WORKDIR /application
RUN pip3 install psycopg2
RUN pip install -r requirements.txt
#  && export POSTGRESQL_URL=postgresql://worker:worker@db/app \
#  && flask db upgrade
ENV POSTGRESQL_URL="postgresql://worker:worker@db:5432/app"
RUN flask db upgrade
EXPOSE 5000
CMD ["python3", "app.py"]