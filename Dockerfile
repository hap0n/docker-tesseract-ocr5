FROM python:3.7.13-bullseye

RUN apt update

# install tesseract-ocr 5.2.0
RUN apt install automake ca-certificates g++ git libtool libleptonica-dev make pkg-config -y
RUN git clone --depth 1  https://github.com/tesseract-ocr/tesseract.git --branch 5.2.0
WORKDIR tesseract
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN ldconfig

# download eng model
RUN wget https://github.com/tesseract-ocr/tessdata/raw/main/eng.traineddata --directory-prefix=/usr/local/share/tessdata

