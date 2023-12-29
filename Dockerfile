FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y python3
RUN pip3 install --upgrade pip
RUN apt-get install ffmpeg libsm6 libxext6 -y
RUN pip3 install pytesseract
RUN pip3 install opencv-python
RUN pip3 install pillow
RUN pip install tensorflow
RUN pip install shutils
RUN pip install numpy
RUN pip install pandas
RUN pip install flask

ENTRYPOINT ["python"]
CMD ["app.py"]