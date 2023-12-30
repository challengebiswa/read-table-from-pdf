FROM python:3.7.5-slim
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN python -m pip install \
        parse \
        realpython-reader
RUN pip3 install pytesseract
RUN apt-get update \
  && apt-get -y install tesseract-ocr
RUN pip3 install opencv-python
RUN pip3 install pillow
RUN pip3 install tensorflow
RUN pip3 install shutils
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install matplotlib

EXPOSE 5000
WORKDIR /app
RUN pip3 install flask
COPY . .
ENV FLASK_APP=app.py
CMD ["flask", "run", "--host", "0.0.0.0"]