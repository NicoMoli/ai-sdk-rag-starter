# Use the official PostgreSQL image as the base image
FROM postgres:latest

# Install the required packages
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    postgresql-server-dev-all

# Clone the pgvector repository and install the extension
RUN git clone https://github.com/pgvector/pgvector.git /pgvector && \
    cd /pgvector && \
    make && \
    make install

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=nico
ENV POSTGRES_PASSWORD=nico
ENV POSTGRES_DB=vercel-rag-db

# Expose the PostgreSQL port
EXPOSE 5433
