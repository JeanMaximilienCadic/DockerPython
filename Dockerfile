FROM  jcadic/ubuntu:latest

RUN apt update; apt install nano -y

WORKDIR /tmp
RUN wget  https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
#COPY Anaconda3-2020.02-Linux-x86_64.sh /tmp
RUN sh Anaconda3-2020.11-Linux-x86_64.sh -b 
RUN rm Anaconda3-2020.11-Linux-x86_64.sh
ENV PATH /root/anaconda3/bin:$PATH

# Updating Anaconda packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all
RUN conda create -n py37 python=3.7
RUN echo "source activate py37" >> /root/.bashrc

RUN /root/anaconda3/envs/py37/bin/pip install gnutools-python



WORKDIR /root
