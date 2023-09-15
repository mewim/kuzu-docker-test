# Use the FastAPI image
FROM tiangolo/uvicorn-gunicorn:python3.10
RUN useradd --create-home runner

# RUN chown -R runner:runner /databases
RUN export PATH=/home/runner/.local/bin:$PATH

USER runner
# Install dependencies
RUN pip install fastapi "uvicorn[standard]" kuzu pandas numpy

# Copy source code
COPY ./ /db_api/