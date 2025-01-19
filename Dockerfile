#https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-base
FROM nvcr.io/nvidia/l4t-base:r36.2.0

#This should be parameterized based on the user of app 

ENV TZ=America/Los_Angeles \
    DEBIAN_FRONTEND=noninteractive

ENV QT_QPA_PLATFORM=xcb

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-tk \
        pkg-config \
        python3-pip \
        python3-dev \
        libhdf5-dev \
        hdf5-tools \
        libgtk2.0-dev \
        libglib2.0-dev \
        build-essential \
        libgtk-3-dev \
        build-essential \
        libgtk-3-dev \
        mesa-utils \
        libgl1-mesa-glx \
        libxcb-cursor0 \
        libxcb-cursor-dev \
        qtbase5-dev \
        qt5-gtk-platformtheme  \
        qt5-qmake-bin qtchooser \
        qt5-qmake \
        qtbase5-dev-tools \
        qttranslations5-l10n \
        qtbase5-dev && \ 
    rm -rf /var/lib/apt/lists/*


RUN pip install setuptools==43.0.0
RUN pip install deeplabcut-live
ENTRYPOINT ["dlc-live-test"]

