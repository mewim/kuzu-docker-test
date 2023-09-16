FROM --platform=arm64 ubuntu:22.04
RUN useradd --create-home runner

RUN apt-get update
RUN apt-get install -y build-essential cmake git gcc g++ python3 python3-dev python3-pip
RUN mkdir -p /database /data
RUN chown -R runner:runner /database /data

USER runner
ENV PATH="${PATH}:/home/runner/.local/bin"
RUN pip install fastapi "uvicorn[standard]" kuzu pandas numpy

# Copy source code
WORKDIR /home/runner/
COPY --chown=runner:runner test.py test.py

ENTRYPOINT ["python3", "./test.py"]
