FROM python:alpine as base
WORKDIR /mediaInfoService
COPY mediaInfoService.run.pip .
RUN pip install --no-cache-dir -r mediaInfoService.run.pip


FROM base as production
COPY mediaInfoService.py .
ARG PORT=8331
ENV PORT=${PORT}
EXPOSE ${PORT}
ENTRYPOINT ["python3", "mediaInfoService.py"]
#ENTRYPOINT python3 mediaInfoService.py --port ${PORT}
# : this shell form entrypoint may prevent sigterm shutdown of the container - investigate


FROM base as base_test
COPY mediaInfoService.test.pip .
RUN pip install --no-cache-dir -r mediaInfoService.test.pip

FROM base_test as test
COPY --from=production /mediaInfoService/* ./
COPY mediaInfoService_test.py mediaInfoService_test.png ./
RUN pytest --doctest-modules mediaInfoService_test.py


FROM production
