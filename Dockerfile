FROM python:alpine as base

COPY mediaInfoService.pip /
RUN pip install --no-cache-dir -r /mediaInfoService.pip

COPY mediaInfoService.py /


ARG PORT=8331
ENV PORT=${PORT}
EXPOSE ${PORT}
ENTRYPOINT ["python3", "mediaInfoService.py"]
#ENTRYPOINT python3 mediaInfoService.py --port ${PORT}
# : this shell form entrypoint may prevent sigterm shutdown of the container - investigate


FROM base as test
RUN pip install --no-cache-dir \
    pytest
COPY mediaInfoService_test.py mediaInfoService_test.png /
RUN pytest --doctest-modules mediaInfoService_test.py


FROM base
