# Use the FastAPI image
FROM tiangolo/uvicorn-gunicorn:python3.10
RUN useradd --create-home runner

RUN mkdir -p /database /data
RUN chown -R runner:runner /database /data

USER runner
RUN export PATH=/home/runner/.local/bin:$PATH
RUN pip install fastapi "uvicorn[standard]" kuzu pandas numpy

# Copy source code
WORKDIR /home/runner/
COPY --chown=runner:runner test.py test.py

ENTRYPOINT ["python", "./test.py"]
