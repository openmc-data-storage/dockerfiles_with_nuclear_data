# This Dockerfile contains ENDFB-7.1 NNDC and TENDL 2019 nuclear data

# This Dockerfile can be build locally or a prebuild image can be downloaded

# To download the prebuild image
# docker pull ghcr.io/openmc-data-storage/miniconda3_4.9.2_endfb-7.1_nndc_tendl_2019

# To build this Dockerfile into a docker image:
# docker build -t miniconda3_4.9.2_endfb-7.1_nndc_tendl_2019 .

# To run the locally built Docker image:
# docker run -it miniconda3_4.9.2_endfb-7.1_nndc_tendl_2019

# To run the prebuilt Docker image:
# docker run -it ghcr.io/fusion-energy/miniconda3_4.9.2_endfb-7.1_nndc_tendl_2019

FROM continuumio/miniconda3:4.9.2 as dependencies

RUN pip install numpy=1.20.4
# installs python packages and nuclear data
RUN pip install openmc_data_downloader && \
    openmc_data_downloader -d nuclear_data -e all -i H3 -l ENDFB-7.1-NNDC TENDL-2019 -p neutron photon
