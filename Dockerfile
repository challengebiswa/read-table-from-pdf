FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get -y install tesseract-ocr \
  && apt-get install -y python3 python3-distutils python3-pip \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN apt update \
  && apt-get install ffmpeg libsm6 libxext6 -y
RUN pip3 install pytesseract
RUN pip3 install opencv-python
RUN pip3 install pillow
RUN pip install tensorflow
RUN pip install shutils
RUN pip install numpy
RUN pip install pandas
RUN pip install flask


COPY . /app
WORKDIR /app

RUN mkdir src && cd /app/src && \
    wget https://github.com/tesseract-ocr/tesseract/archive/5.0.0-alpha-20201224.zip && \
	unzip 5.0.0-alpha-20201224.zip && \
    cd /app/src/tesseract-5.0.0-alpha-20201224 && ./autogen.sh && ./configure && make && make install && ldconfig && \
    make training && make training-install && \
    cd /usr/local/share/tessdata && wget https://github.com/tesseract-ocr/tessdata_best/raw/master/eng.traineddata



ENTRYPOINT ["python3"]
CMD ["app.py"]